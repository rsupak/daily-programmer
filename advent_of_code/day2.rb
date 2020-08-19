def intcode(data, data1 = 0, data2 = 0)
  noun = 0
  verb = 0
  step = 0
  origin = data
  data[1], data[2] = data1, data2

  while step < data.size
    num = data[step]
    break if num == 99

    if [1, 2].include?(num)
      noun = data[data[step + 1]]
      verb = data[data[step + 2]]
      data[data[step + 3]] = num == 1 ? noun + verb : noun * verb
      # p data[data[step + 3]] # if data[data[step + 3]] == 19690720
    end
    step += 4
  end
  return data[0]
end

file = File.open("day2.txt")
# data = file.read.split(',').map(&:strip).map(&:to_i)
i = 0
j = 0

while i <= 99
  data = file.read.split(',').map(&:strip).map(&:to_i) 
  while j <= 99
    if intcode(data, i, j) == 19690720
      p "Yep"
    else
      p "Nope"
    end
    j += 1
  end
  i += 1
end
