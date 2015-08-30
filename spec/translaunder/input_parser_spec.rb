#encoding: utf-8
require 'spec_helper'

describe TransLaunder::InputParser do
  describe '#validate' do
    context '入力値が空の場合' do
      it 'ヘルプメッセージを表示する' do
        parser = TransLaunder::InputParser.new []
        expect { parser.parse }.to raise_error SystemExit
      end
    end

    context '配列の個数が足りない場合' do
      it 'エラーメッセージを表示する' do
        parser = TransLaunder::InputParser.new ['ja', 'en']
        expect { parser.parse }.to raise_error SystemExit
      end
    end

    context 'オプションの指定がある場合' do
      it 'v オプション' do
        parser = TransLaunder::InputParser.new ['-v']
        expect { parser.parse }.to raise_error SystemExit
      end

      it 'h オプション' do
        parser = TransLaunder::InputParser.new ['-h']
        expect { parser.parse }.to raise_error SystemExit
      end
    end

    context '正常な処理' do
      it 'ハッシュを返す' do
        parser = TransLaunder::InputParser.new ['ja', 'en', '事なきを得る']
        expect(parser.parse).to eq({ source_lang: :ja, target_lang: :en, text: '事なきを得る' })
      end
    end
  end
end

