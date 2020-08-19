def hex_speak(num)
  valid_chars = 'abcdefioABCDEFIO'
  hex = num.to_i.to_s(16).split('')
  hex.each_index do |i|
    hex[i] = 'I' if hex[i] == '1'
    hex[i] = 'O' if hex[i] == '0'
    return 'ERROR' unless valid_chars.include?(hex[i])
  end
  hex.join('').upcase
end

p hex_speak('257')
p hex_speak('3')
p hex_speak('10')
