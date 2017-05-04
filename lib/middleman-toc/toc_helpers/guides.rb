module TocHelpers
  module Guides
    def previous_guide
      return unless current_guide

      current_guide_index = data.pages.find_index(current_guide)
      return unless current_guide_index

      previous_guide_index = current_guide_index - 1

      if previous_guide_index >= 0
        data.pages[previous_guide_index]
      else
        nil
      end
    end

    def next_guide
      return unless current_guide

      current_guide_index = data.pages.find_index(current_guide)
      return unless current_guide_index

      next_guide_index = current_guide_index + 1

      if current_guide_index < data.pages.length
        data.pages[next_guide_index]
      else
        nil
      end
    end

    private

    def current_guide
      return @current_guide if @current_guide

      path = current_page.path.gsub('.html', '')
      guide_path = path.split("/")[0]

      @current_guide = data.pages.find do |guide|
        guide.url == guide_path
      end
    end

    def current_guide_index
      data.pages.find_index(current_guide)
    end
  end
end
