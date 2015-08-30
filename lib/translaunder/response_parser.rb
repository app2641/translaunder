#encoding: utf-8
require 'json'

module TransLaunder
  class ResponseParser
    def initialize text
      @text = text
    end

    def parse
      @text = decode @text
      extract_text
    end

    private

    def decode text
      encoding = 'UTF-8'
      text.gsub!(/(\\x26#39;)/, "'")
      text.force_encoding(encoding).encode(encoding)
    end

    def extract_text
      texts = @text.split("[[[")[1].sub!(/\]\].*/, ']').gsub!(/"/, '').split("],[")
      texts.map! do |t|
        t = t.split(",")
        t.first unless t.first.empty?
      end
      texts.join("")
    end
  end
end
