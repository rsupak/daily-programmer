def transpose(arr)
  temp_arr = Array.new(3) { [] }
  arr.each do |row|
    row.each_index do |i|
      temp_arr[i] << row[i]
    end
  end
  temp_arr
end

def transpose!(arr)
  arr.size.times do |i|
    0.upto(i) do |j|
      arr[i][j], arr[j][i] = arr[j][i], arr[i][j]
    end
  end
  arr
end

def xor_transpose(arr)
  arr.each_index do |i|
    0.upto(i - 1) do |j|
      arr[i][j] = arr[j][i] ^ arr[i][j]
      arr[j][i] = arr[i][j] ^ arr[j][i]
      arr[i][j] = arr[j][i] ^ arr[i][j]
    end
  end
  arr
end

# arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# p arr.transpose
# p transpose(arr)
# p arr
# p transpose!(arr)
# p arr
# p xor_transpose(arr)
# p arr

class Array
  def transpose!
    size.times do |i|
      0.upto(i) do |j|
        self[i][j], self[j][i] = self[j][i], self[i][j]
      end
    end
    self
  end
end

arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# p arr.transpose
# p arr
# p arr.transpose!
# p arr

def abbreviate_sentence(sentence)
  sentence = sentence.split.map do |word|
    word.length > 4 ? vowel_remover(word) : word
  end
  sentence.join(' ')
end

def vowel_remover(word)
  vowels = 'aeiou'
  new_word = ''
  word.each_char do |char|
    next if vowels.include?(char)

    new_word << char
  end
  new_word
end

puts abbreviate_sentence('follow the yellow brick road') # => "fllw the yllw brck road"
puts abbreviate_sentence('what a wonderful life')   # => "what a wndrfl life"
