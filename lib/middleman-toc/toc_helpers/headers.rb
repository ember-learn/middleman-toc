module TocHelpers
  module Headers
    def toc_header(text, level)
      "<h#{level} class='anchorable-toc' id='toc_#{toc_anchorify(text)}'>#{text}</h#{level}>"
    end

    private

    def toc_anchorify(text)
      text.gsub(/&#?\w+;/, '-').gsub(/\W+/, '-').gsub(/^-|-$/, '').downcase
    end
  end
end
