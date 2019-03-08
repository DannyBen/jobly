require 'mister_bin'
require 'colsole'
require 'lp'

module Jobly
  module Commands
    class Base < MisterBin::Command
      include Colsole
    end
  end
end