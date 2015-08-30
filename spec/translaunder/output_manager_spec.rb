#encoding: utf-8
require 'spec_helper'

describe TransLaunder::OutputManager do
  describe 'output' do
    it 'display error message' do
      methods = [:display_help_and_quit, :display_version_and_quit, :display_error_msg,
        :display_no_internet_msg]

      methods.each do |method|
        expect {TransLaunder::OutputManager.send(method)}.to raise_error SystemExit
      end
    end

    it 'display translate message' do
      expect {TransLaunder::OutputManager.send(:display_translation, 'foo')}.to \
        output("=> foo\n").to_stdout
    end
  end
end

