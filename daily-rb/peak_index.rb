def find_max_peak(mount)
  (1...mount.size - 1).each do |i|
    return i if peak_test(mount, i) && up_ramp(mount, i) && down_ramp(mount, i)
  end
  -1 # no peaks found which follow the rules
end

def peak_test(mount, index)
  mount[index - 1] < mount[index] && mount[index] > mount[index + 1]
end

def up_ramp(mount, index)
  (0...index).all? { |x| mount[x] < mount[x + 1] }
end

def down_ramp(mount, index)
  (index + 1...mount.size - 1).all? { |x| mount[x] > mount[x + 1] }
end

mount = [0, 1, 3, 2, 5, 0]
p find_max_peak(mount)


class Array
  def find_max_peak
    return -1 unless all? { |x| x.is_a?(Integer) }

    (1...size - 1).each do |i|
      return i if (self[i - 1] < self[i] && self[i] > self[i + 1]) &&
                  (0...i).all? { |x| self[x] < self[x + 1] } &&
                  (i + 1...size - 1).all? { |x| self[x] > self[x + 1] }
    end
    -1 # no peaks found which follow the rules
  end
end

p [0, 1, 3, 2, 5, 0].find_max_peak

def find_peaks(mount)
  peaks = []
  mount.each_index { |i| peaks << i if peak_test(mount, i) }
  peaks.reduce(0) { |acc, p| mount[acc] < mount[p] ? p : acc }
end

mount = [0, 1, 5, 2, 3, 0]
p find_peaks(mount)
