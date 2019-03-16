require 'spec_helper'

describe API do
  describe "GET /" do
    it "works" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match_fixture('api/root').diff 3
    end
  end

  describe "GET /*" do
    context "with an invalid job" do
      it "returns 404 and a json body" do
        get '/NoJob'
        expect(last_response.status).to eq 404
        expect(last_response.body).to match_fixture 'api/nojob'
      end
    end

    context "with a valid job" do
      it "queues the job" do
        expect(Greet).to receive(:perform_async)
        get '/Greet'
        expect(last_response).to be_ok
      end
    end

    context "with job params" do
      it "queues the job with params" do
        expect(Greet).to receive(:perform_async).with(name: "Harry The Great")
        get '/Greet?name=Harry%20The%20Great'
        expect(last_response).to be_ok
      end
    end

    context "with job that contains slashes" do
      it "loads a namespaced job" do
        expect(Namespaced::Hello).to receive(:perform_async).with(name: "Colombo")
        get '/Namespaced/Hello?name=Colombo'
        expect(last_response).to be_ok
      end
    end
  end

  describe "POST /*" do
    it "queues the job with params" do
      expect(Greet).to receive(:perform_async).with(name: "Lloyd Christmas")
      post '/Greet', name: "Lloyd Christmas"
      expect(last_response).to be_ok
    end

    context "with job that contains slashes" do
      it "loads a namespaced job" do
        expect(Namespaced::Hello).to receive(:perform_async).with(name: "Jeronimo")
        post '/Namespaced/Hello?name=Jeronimo'
        expect(last_response).to be_ok
      end
    end
  end
end