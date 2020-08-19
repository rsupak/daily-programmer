def bs_compare(string1, string2)
  simplify = Proc.new do |string|
    string = string.split('')
    string.each.with_index do |c, i|
      if c == '#'
        string = (string[0...i - 1] + string[i + 1...string.size]).join('')
        simplify.call(string)
      end
    end
    string.join('')
  end
  p simplify.call(string1)
  # p simplify.call(string2)
  # simplify.call(string1) == simplify.call(string2)
end

# def simplify(string)
  # string = string.split('')
  # string.each.with_index do |c, i|
  #   unless ('a'..'z').include?(c)
  #     2.times { string.delete_at(i - 1) }
  #     return simplify(string.join(''))
  #   end
  # end
  # string.join('')
# end
  

p bs_compare("a##cd", "c#d#d")
# bs_compare("a#c", "b")
