#encoding: utf-8
module TransLaunder
  class Main
    def initialize params
      @params = params
    end

    def translate
      text = get_translate_text

      @params = {
        source_lang: @params[:target_lang],
        target_lang: @params[:source_lang],
        text: text
      }

      text = get_translate_text
      OutputManager::display_translation text
    end

    private

    def get_translate_text
      response = DataRequest.new(@params).request
      ResponseParser.new(response.body).parse
    end
  end
end
