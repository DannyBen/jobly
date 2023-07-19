require 'spec_helper'

describe Commands::ServerCmd do
  context 'without arguments' do
    it 'runs the dashboard and api server' do
      command = [
        'rackup', '--env', 'development', '--port', '3000',
        '--host', '0.0.0.0', match(%r{.*/lib/jobly/config.ru})
      ]
      expect_any_instance_of(described_class).to receive(:exec).with(*command)
      expect { subject.execute %w[server] }.to output_approval('cli/server/no-args')
    end
  end

  context 'with --help' do
    it 'shows long usage' do
      expect { subject.execute %w[server --help] }.to output_approval('cli/server/help')
    end
  end
end
