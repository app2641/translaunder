#encoding: utf-8
module TransLaunder
  class InputParser
    def initialize input
      @input = input
    end

    def parse
      validate

      {
        source_lang: @input.shift.to_sym,
        target_lang: @input.shift.to_sym,
        text: @input.join(' ')
      }
    end

    private

    def validate
      OutputManager::display_help_and_quit if @input.index('-h') || @input.empty?
      OutputManager::display_version_and_quit if @input.index("-v")
      raise ArgumentError if @input.length < 3

      @input.first(2).each do |lang|
        raise ArgumentError unless [2, 4].include? lang.length
      end
    rescue ArgumentError
      OutputManager::display_error_msg
    end
  end
end
