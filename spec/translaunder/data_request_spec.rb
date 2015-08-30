#encoding: utf-8
require 'spec_helper'

describe TransLaunder::DataRequest do
  describe 'request method' do
    let(:params) { {source_lang: 'ja', target_lang: 'en', text: '事なきを得る'} }
    let(:data_request) { TransLaunder::DataRequest.new(params) }
    let(:http) { double 'http' }

    before do
      expect(http).to receive(:request)
      expect(http).to receive(:use_ssl=)

      allow(Net::HTTP).to receive(:new).and_return(http)
    end

    it 'GoogleTranslateへhttpリクエストする' do
      expect { data_request.request }.not_to raise_error
    end

    it 'エラーが起きたらヘルプメッセージを表示する' do
      allow(http).to receive(:request).and_raise(SocketError)
      expect(TransLaunder::OutputManager).to receive(:display_no_internet_msg)
      data_request.request
    end
  end
end

