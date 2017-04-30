require "middleman-core"

::Middleman::Extensions.register :toc do
  require "middleman-toc/extension"
  ::Middleman::TocExtension
end
