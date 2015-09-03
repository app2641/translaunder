#encoding: utf-8
module TransLaunder
  class OutputManager
    def self.display_help_and_quit
      puts <<-EOS
========= TRANSLAUNDER =========
Usage:
translaunder 'source_language' 'target_language' 'text'

Example:
translaunder ja en 'やあカウボーイ、馬はどこ？'
=> 'ちょっとカウボーイ、どこに馬がいるのですか？'

Check docs at: github.com/app2641/translaunder
EOS
      exit
    end

    def self.display_version_and_quit
      puts "TransLaunder #{TransLaunder::VERSION}"
      exit
    end

    def self.display_error_msg
      puts "TRANSLAUNDER: Wrong data."
      puts "Example: 'translaunder ja en カウボーイ' => 'カウボーイ'"
      exit
    end

    def self.display_no_internet_msg
      puts "TRANSLAUNDER: There seems to be a problem with your internet connection"
      exit
    end

    def self.display_translation text
      puts "=> #{text}"
    end
  end
end
