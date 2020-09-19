def translate(string)
  string = string.split(' ')
  string.map!.with_index do |word, index|
    add_a(suffix_it(word), index)
  end
  string
end

def suffix_it(word)
  vowels = 'aeiou'
  caps = word[0] == word[0].upcase
  word = word.downcase.split('')
  word.rotate! unless vowels.include?(word[0])
  caps ? word.join.capitalize << 'ma' : word.join << 'ma'
end

def add_a(word, index)
  index.times do
    word << 'a'
  end
  word
end

p translate("The quick brown fox jumped over the lazy dog")
