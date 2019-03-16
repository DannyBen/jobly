require 'spec_helper'

describe Server do
  describe "GET /" do
    it "serves the sidekiq dashboard" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match(/<title>\[(DEVELOPMENT|TEST)\] Sidekiq<\/title>/)
    end
  end

  describe "GET /do" do
    it "serves the API" do
      get '/do'
      expect(last_response).to be_ok
      expect(last_response.body).to include("I'm gonna live till I die")
    end
  end

  context "when custom mounts are defined" do
    let(:custom_mount) do
      Proc.new do |env|
        ['200', {'Content-Type' => 'text/plain'}, ['A trip to barbados']]
      end
    end

    let(:mounts) { { "/custom" => custom_mount } }

    before { Jobly.mounts = mounts }
    after  { Jobly.mounts = nil }

    it "mounts the custom app" do
      get '/custom'
      expect(last_response).to be_ok
      expect(last_response.body).to eq "A trip to barbados"
    end
    
  end

  context "when basic auth is enabled" do
    before { Jobly.auth = 'bill:dollar' }
    after  { Jobly.auth = nil }

    it "blocks the dashboard" do
      get '/'
      expect(last_response).to be_unauthorized
    end

    it "blocks the API" do
      get '/do'
      expect(last_response).to be_unauthorized
    end

    context "when valid credentials are provided" do
      before { basic_authorize 'bill', 'dollar' }

      it "allows access" do
        get '/'
        expect(last_response).to be_ok
      end
    end

  end
end