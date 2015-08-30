#encoding: UTF-8
require 'spec_helper'

describe TransLaunder::Main do
  describe '#translate' do
    before do
      response = double 'response_mock'
      expect(response).to receive(:body).twice.and_return(:good_response)

      data_request = double 'data_request_mock'
      expect(data_request).to receive(:request).twice.and_return(response)
      expect(TransLaunder::DataRequest).to receive(:new).twice.and_return(data_request)

      response_parser = double 'response_parser_mock'
      expect(response_parser).to receive(:parse).twice
      expect(TransLaunder::ResponseParser).to receive(:new).twice.and_return(response_parser)
    end

    context '事なきを得る' do
      it 'translate' do
        TransLaunder::Main.new(source_lang: 'ja', target_lang: 'en', text: '事なきを得る').translate
      end
    end
  end
end

