module TocHelpers
  module Chapters
    def chapter_links
      %Q{
      <footer>
        #{previous_chapter_link} #{next_chapter_link}
      </footer>
      }
    end

    def previous_chapter_link
      options = {:class => 'previous-guide'}

      if previous_chapter
        url = "/#{current_guide.url}/#{previous_chapter.url}.html"
        title = previous_chapter.title

        link_to(title, url, options)
      elsif whats_before = previous_guide
        previous_chapter = whats_before.pages.last

        is_root = previous_chapter.url.empty?

        url = is_root ? "/#{previous_guide.url}.html" : "/#{previous_guide.url}/#{previous_chapter.url}.html"

        title = previous_chapter.title

        link_to(title, url, options)
      else
        ''
      end
    end

    def next_chapter_link
      options = {:class => 'next-guide'}

      if next_chapter
        url = "/#{current_guide.url}/#{next_chapter.url}.html"
        title = next_chapter.title

        link_to(title, url, options)
      elsif whats_next = next_guide
        next_chapter = whats_next.pages.first
        title = "We've finished covering #{current_guide.title}. Next up: #{next_guide.title} - #{next_chapter.title}"
        url = "/#{next_guide.url}/#{next_chapter.url}.html"

        link_to(title, url, options)
      else
        ''
      end
    end

    def previous_chapter
      return unless current_guide

      current_chapter_index = current_guide.pages.find_index(current_chapter)

      return unless current_chapter_index

      previous_chapter_index = current_chapter_index - 1

      if current_chapter_index > 0
        current_guide.pages[previous_chapter_index]
      else
        nil
      end
    end

    def next_chapter
      return unless current_guide

      current_chapter_index = current_guide.pages.find_index(current_chapter)
      return unless current_chapter_index

      next_chapter_index = current_chapter_index + 1

      if current_chapter_index < current_guide.pages.length
        current_guide.pages[next_chapter_index]
      else
        nil
      end
    end

    private

    def current_chapter
      return unless current_guide

      return @current_chapter if @current_chapter
      path = current_page.path.gsub('.html', '')
      chapter_path = path.split('/')[1..-1].join('/')

      @current_chapter = current_guide.pages.find do |chapter|
        chapter.url == chapter_path
      end
    end

    def current_chapter_index
      return unless current_guide
      current_guide.chapters.find_index(current_chapter)
    end
  end
end
