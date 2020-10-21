# frozen_string_literal: true

require 'pry'
def balanced_brackets(string)
  stack = []
  opening_bracket = '([{'
  closing_bracket = '})]'
  matching_brackets = { "}" => "{", ")" => "(", "]" => "[" }

  string.split('').each do |bracket|
    if opening_bracket.split('').include? bracket
      stack << bracket
    elsif closing_bracket.split('').include? bracket
      if stack.length.zero?
        return false
      elsif stack[-1] == matching_brackets[bracket]
        stack.pop
      end
    end
  end
  stack.empty?
end

p balanced_brackets("([])(){}(())()()")

