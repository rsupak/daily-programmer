roman_nums = {"M" => 1000,
              "CM" => 900,
              "D" => 500,
              "CD" => 400,
              "C" => 100,
              "XC" => 90,
              "L" => 50,
              "XL" => 40,
              "X" => 10,
              "IX" => 9,
              "V" => 5,
              "IV" => 4,
              "I" => 1}

numerals = ""
def romanize(number, hash, string)
  if number < 1
    string.join(" ")
  else
    hash.keys.each do |key|
      if number >= hash[key]
        number -= hash[key]
        string << key
      end
    end
  end
end

puts romanize(25, roman_nums, numerals).inspect
