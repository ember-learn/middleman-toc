require "middleman-core"
require 'middleman-toc/cli'
require 'middleman-toc/version'

::Middleman::Extensions.register :toc do
  require "middleman-toc/extension"
  ::Middleman::TocExtension
end
