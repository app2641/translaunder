#encoding: utf-8
require 'net/http'
require 'uri'

module TransLaunder
  class DataRequest
    def initialize params
      @params = params
    end

    def request
      url = generate_url

      uri = URI.parse url
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      http.request(request)
    rescue SocketError
      OutputManager::display_no_internet_msg
    end

    private

    def generate_url
      text = URI.encode @params[:text]
      "https://translate.google.com/translate_a/single?client=t"+
        "&sl=#{@params[:source_lang]}&tl=#{@params[:target_lang]}&hl=ja"+
        "&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at"+
        "&ie=UTF-8&oe=UTF-8&otf=1&ssel=0&tsel=0&kc=6&q=#{text}"
    end
  end
end
