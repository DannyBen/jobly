class SoloOptionsJob < Jobly::Job
  solo expire: 5.minutes, key: 'inigo:montoya'

  before  { puts 'before called' }
  after   { puts 'after called' }

  on_skip { puts 'on_skip called' }

  def execute
    # :nocov:
    puts 'execute called'
    puts "solo_locked? returned #{solo_locked?}"
    # :nocov:
  end
end
