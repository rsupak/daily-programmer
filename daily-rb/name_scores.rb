def read_names_from_file(filepath)
  names = nil
  fh = File.open(filepath)
  fh.each do |line|
    names = line.gsub(/["]/, '').strip.split(',').sort
  end
  fh.close
  names
end

def score_names(filepath)
  names = read_names_from_file(filepath)
  alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  names = names.map.with_index do |name, i|
    name = name.split('').map do |char|
      alpha.index(char) + 1
    end
    name.reduce(&:+) * (i + 1)
  end
  names
end

def sum_names(filepath)
  nums = score_names(filepath)
  nums.reduce(&:+)
end

filepath = './names_txt.txt'
p sum_names(filepath)
