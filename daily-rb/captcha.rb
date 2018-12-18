def captcha(str)
  sum = 0
  str = str.split('').map(&:to_i)
  str.each_index do |i|
    if str[i] == str[i+1] || str[i] == str[i-1]
      sum += str[i]
    elsif i == str.length - 1
      sum += str[i] if str[i] == str[0]
    end
  end
  sum
end

p captcha('1122')
