module TocHelpers
  module Titles
    def full_page_title
      current_titles.join(": ")
    end

    def page_title
      current_titles.last
    end

    private

    def current_titles
      @current_titles ||= current_pages.map(&:title)
    end

    def current_pages
      @current_pages ||= pages_for_slugs(current_slugs)
    end

    def current_slugs
      @current_slugs ||= current_page.path.gsub(".html", "").split("/")
    end

    def pages_for_slugs(slugs, pages=data.pages)
      current_slug = slugs.shift
      page = pages.find { |page| page.url == current_slug }
      remaining_pages = slugs.any? ? pages_for_slugs(slugs, page.pages) : []
      [page] + remaining_pages
    end
  end
end
