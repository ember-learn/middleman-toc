require "middleman-core"
require 'middleman-toc/cli'

::Middleman::Extensions.register :toc do
  require "middleman-toc/extension"
  ::Middleman::TocExtension
end
