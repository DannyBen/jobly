require 'spec_helper'

describe Commands::SendCmd, :mockserver do
  context 'without arguments' do
    it 'shows usage' do
      expect { subject.execute %w[send] }.to output_approval('cli/send/no-args')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.execute %w[send --help] }.to output_approval('cli/send/help')
    end
  end

  context 'with a job argument' do
    it 'calls the api' do
      expect { subject.execute %w[send Greet] }.to output_approval('cli/send/greet')
    end

    context 'with job parameters' do
      it 'calls the api' do
        expect { subject.execute %w[send Greet name:Bobby] }.to output_approval('cli/send/greet-params')
      end
    end

    context 'when the api returns a non-200 code' do
      it 'shows the status code' do
        expect { subject.execute %w[send Error] }.to raise_error(HTTPError, '500 Internal Server Error')
      end
    end
  end

  context 'when the server requires basic auth' do
    before do
      Jobly.api_url = 'http://localhost:3000/secure'
    end

    after do
      Jobly.auth = nil
      Jobly.api_url = 'http://localhost:3000/do'
    end

    context 'when the client credentials are valid' do
      before { Jobly.auth = 'bill:dollar' }

      it 'allows execution' do
        expect { subject.execute %w[send Greet] }.to output_approval('cli/send/greet')
      end
    end

    context 'when the client credentials are invalid' do
      before { Jobly.auth = 'perry:cent' }

      it 'blocks' do
        expect { subject.execute %w[send Greet] }.to raise_error(HTTPError, '401 Unauthorized')
      end
    end
  end
end
