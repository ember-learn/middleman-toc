require 'middleman-core'
require 'middleman-toc/toc_helpers'

module Middleman
  class TocExtension < Extension
    def initialize(app, options_hash={}, &block)
      # Call super to build options from the options_hash
      super

      # Require libraries only when activated
      require 'redcarpet'
      require 'pry'
    end

    helpers ::TocHelpers
  end
end
