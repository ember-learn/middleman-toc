module TocHelpers
  module Main
    def toc_for(pages)
      "<nav class='toc-container' aria-label='table of contents'>#{build_toc_for(pages)}</nav>"
    end

    private

    def build_toc_for(pages, level=0, base_path="", parent_current=true)
      buffer = "<ol class='toc-level-#{level}#{parent_current ? ' selected' : ''}'>"
      # indentation below is to aid in understanding the HTML structure
        pages.each do |page|
          next if page.skip_toc

          requested_page_url = current_page.path.gsub('.html', '').split('/')[level]
          current = (parent_current && page.url == requested_page_url)

          page_path = base_path + "/" + page.url

          unless page.pages || File.exist?(file = "source/localizable" + page_path + ".md")
            raise "#{file} does not exist but is referenced in data/guides.yml."
          end

          buffer << "<li class='toc-level-#{level} #{current ? 'selected' : ''}'>"
            if page.pages
              buffer << link_to(page.title, '#')
              buffer << build_toc_for(page.pages, level + 1, page_path, current)
            else
              buffer << link_to(page.title, page_path + '.html')
            end
          buffer << "</li>"
        end

      buffer << "</ol>"
      buffer
    end
  end
end
