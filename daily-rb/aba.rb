def aba_translate(string)
  fixed_string = ''
  unreplaced = string
  factor = [unreplaced, fixed_string]
  replaced = false
  until replaced
    replaced = true
    factor = replace(factor)
    replaced = false unless factor[0].nil?
  end
  factor[1]
end

def replace(arr)
  vowels = 'aeiou'
  unreplaced = arr[0]
  fixed_string = arr[1]
  found_vowel = false
  until found_vowel
    unreplaced.each_char.with_index do |char, idx|
      if vowels.include?(char)
        found_vowel = true
        fixed_string = unreplaced[0..idx] + 'b' + char
        unreplaced = unreplaced[idx + 1..-1]
      elsif idx == unreplaced.length - 1 && found_vowel == false
        fixed_string += unreplaced
        unreplaced = nil
        return arr = [unreplaced, fixed_string]
      end
    end
  end
  arr = [unreplaced, fixed_string]
end

p aba_translate('trial')

