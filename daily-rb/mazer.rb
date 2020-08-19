# frozen_string_literal: true

def mazer(row_count, column_count)
  print_odds(column_count)
  return if row_count.zero?

  print_evens(column_count)
  mazer(row_count - 1, column_count)
end

def print_odds(count)
  if count.zero?
    puts('+')
    return
  end
  print('+-')
  print_odds(count - 1)
end

def print_evens(count)
  if count.zero?
    puts('|')
    return
  end
  print('| ')
  print_evens(count - 1)
end

mazer(3, 3)
