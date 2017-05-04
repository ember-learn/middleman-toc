require "bundler"
Bundler.setup

require "middleman-core"
require "yaml"

Dir["./lib/*"].each { |f| require f }
