module Jekyll
  class SpoilerTag < Liquid::Tag
    def initialize(tag_name, text, token)
      super
      @text = text.strip
    end

    def render(context)
      "<div class='octopress-spoiler-tag'>#{@text}</div>"
    end

    private

    def get_config(string)
      Jekyll.configuration({})[string]
    end
  end
end

Liquid::Template.register_tag('spoiler', Jekyll::SpoilerTag)