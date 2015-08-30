#encoding: utf-8
require 'spec_helper'

describe TransLaunder::ResponseParser do
  context 'センテンスがひとつの場合' do
    let(:parser) do
      text = File.open('spec/fixtures/one_sentence.txt').read
      TransLaunder::ResponseParser.new text
    end

    example '事なきを得る' do
      expect(parser.parse).to eq "I get Kotonaki"
    end
  end

  context 'センテンスがふたつの場合' do
    let(:parser) do
      text = File.open('spec/fixtures/two_sentences.txt').read
      TransLaunder::ResponseParser.new text
    end

    example 'ごめん。さよならだ' do
      expect(parser.parse).to eq "I'm sorry . It goodbye"
    end
  end

  context 'センテンスがみっつの場合' do
    let(:parser) do
      text = File.open('spec/fixtures/three_sentences.txt').read
      TransLaunder::ResponseParser.new text
    end

    example 'おはよう。こんにちは。こんばんは' do
      expect(parser.parse).to eq 'good morning. Hello. good evening'
    end
  end
end

