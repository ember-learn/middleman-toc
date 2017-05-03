module Middleman
  module Cli
    class Toc < Thor
      include Thor::Actions
      include Middleman::Configuration::Global

      def self.source_root
        File.dirname File.expand_path("../..", __FILE__)
      end

      namespace :toc
      desc "toc", "Copy assets from middleman-toc plugin into parent app"
      def toc
        app = ::Middleman::Application.server.inst

        copy_file "template/source/javascripts/toc.js", File.join("source", app.js_dir, "toc.js")
        copy_file "template/source/stylesheets/toc.scss", File.join("source", app.css_dir, "toc.scss")
      end
    end
  end
end
