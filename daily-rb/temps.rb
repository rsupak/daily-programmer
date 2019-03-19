# *[Daily Temperatures]*

# Given a list of daily temperatures T, return a list such that, for 
# each day in the input, tells you how many days you would have to wait 
# until a warmer temperature. If there is no future day for which this 
# is possible, put 0 instead.

# # For example, given the list of temperatures `T = [73, 74, 75, 71, 69,
#  72, 76, 73]`, your output should be `[1, 1, 4, 2, 1, 1, 0, 0]`.

# Note: The length of temperatures will be in the range [1, 30000]. Each
# temperature will be an integer in the range [30, 100].

def daily_temps(temps)
  days_to_wait = []
  temps.each.with_index do |temp1, i|
    j = i
    while j < temps.length
      if temps[j] > temp1 && days_to_wait[i].nil?
        days_to_wait << j - i
        break
      end
      j += 1
    end
    days_to_wait << 0 unless days_to_wait[i]
  end
  days_to_wait
end

temps = [73, 74, 75, 71, 69, 72, 76, 73]

p daily_temps(temps)
