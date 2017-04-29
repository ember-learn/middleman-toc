require "middleman-core"

Middleman::Extensions.register :middleman-toc do
  require "my-extension/extension"
  MyExtension
end
