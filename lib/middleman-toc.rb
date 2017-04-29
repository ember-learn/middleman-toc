require "middleman-core"

Middleman::Extensions.register :middleman-toc do
  require "middleman-toc/extension"
  TocExtension
end
