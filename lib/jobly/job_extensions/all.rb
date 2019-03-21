requires '.'

module Jobly
  module JobExtensions
    module All
      include JobExtensions::OptionAccessors
      include JobExtensions::Actions
      include JobExtensions::Solo
      include JobExtensions::Shell
    end
  end
end