require 'spec_helper'

describe Commands::RunCmd do
  context 'without arguments' do
    it 'shows usage' do
      expect { subject.execute %w[run] }.to output_approval('cli/run/no-args')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.execute %w[run --help] }.to output_approval('cli/run/help')
    end
  end

  context 'with a job argument' do
    it 'runs the job immediately' do
      expect { subject.execute %w[run Greet] }.to output_approval('cli/run/greet')
    end

    context 'with job parameters' do
      it 'runs the job immediately with parameters' do
        expect { subject.execute %w[run Greet name:Bobby] }.to output_approval('cli/run/greet-params')
      end
    end

    context 'with job that contains slashes' do
      it 'converts the name to a namespaced job' do
        expect { subject.execute %w[run Namespaced/Hello name:Bobby] }.to output_approval('cli/run/hello-params')
      end
    end

    context 'with --later' do
      it 'sends the job to the work queue' do
        expect(Greet).to receive(:perform_async)
        expect { subject.execute %w[run --later Greet] }.to output_approval('cli/run/greet-later')
      end

      context 'with job parameters' do
        it 'sends the job to the work queue with parameters' do
          expect(Greet).to receive(:perform_async).with({ name: 'Jenkins' })
          expect { subject.execute %w[run --later Greet name:Jenkins] }.to output_approval('cli/run/greet-later-params')
        end
      end
    end

    context 'when there is no such job' do
      it 'raises an error' do
        expect { subject.execute %w[run NoJob] }.to raise_error Jobly::JobNotFound
      end
    end
  end
end
