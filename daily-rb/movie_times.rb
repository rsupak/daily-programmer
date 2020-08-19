def movie_duration(times, dur)
  available_movies = []
  min, max = 0, 0
  times.combination(2).each do |pair|
    if pair.first + pair.last <= dur - 30 && pair.max > max && pair.min > min
      available_movies << pair
    end
  end
  find_longest_pair(available_movies)
end

def find_longest_pair(arr)
  longest_pair = nil
  arr.each do |pair|
    longest_pair = pair if longest_pair.nil?
    longest_pair = pair if pair.reduce(:+) > longest_pair.reduce(:+)
  end
  longest_pair
end

times = [90, 85, 75, 60, 120, 150, 125]
dur = 250

p movie_duration(times, dur)
