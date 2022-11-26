class SoloJob < Jobly::Job
  solo

  before  { puts 'before called' }
  after   { puts 'after called' }

  on_skip { puts 'on_skip called' }

  def execute
    puts 'execute called'
    puts "solo_locked? returned #{solo_locked?}"
  end
end
