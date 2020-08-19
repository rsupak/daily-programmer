# frozen_string_literal: true

def aba_translate(string)
  vowels = 'aeiou'
  result = ''
  string.each_char do |char|
    result += vowels.include?(char) ? char + 'b' + char : char
  end
  result
end

p aba_translate('trial')
# p aba_translate('cats')
# p aba_translate('dog')
# p aba_translate('kite')
# p aba_translate('afrika')
# p aba_translate('fly')
