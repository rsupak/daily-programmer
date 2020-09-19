# [Cellular Automata]

# Eight houses, represented as cells, are arranged in a straight line.
# An integer value of 1 represents an active cell and a value of 0 represents
# an inactive cell.

# Each day, every cell competes with its adjacent cells (neighbors).
# If the neighbors on both sides of a cell are the same, the cell
# becomes inactive on the next day.  Otherwise, the cell becomes active.

# The two cells on each end have a single adjacent cell, so assume that the
# unoccupied space on the opposite side is an inactive cell.

# Even after updating the cell state, consider its previous state when updating 
# the state of other cells.  (The state information of all cells should be 
# updated simultaneously).

# Write an algorithm to output the state of the cells after the given number of days.

# Examples:
# runCellularAutomata([1, 0, 0, 0, 0, 1, 0, 0], 1) === [0, 1, 0, 0, 1, 0, 1, 0]
# runCellularAutomata([1, 1, 1, 0, 1, 1, 1, 1], 2) === [0, 0, 0 ,0, 0, 1, 1, 0]

# Index      0  1  2  3  4  5  6  7
# Day 0 = 0 [1, 0, 0, 0, 0, 1, 0, 0] 0,
# Day 1 = 0 [0, 1, 0, 0, 1, 0, 1, 0] 0

# if same = 0
# if not = 1

# Day 0 = 0 [1, 1, 1, 0, 1, 1, 1, 1] 0
# Day 1 = 0 [1, 0, 1, 0, 1, 0, 0, 1] 0
# Day 2 = 0 [0, 0, 0, 0, 0, 1, 1, 0] 0

def cycle_cells(current_values, day_count)
  return current_values if day_count.zero?

  prev_values = cycle_cells(current_values, day_count - 1)
  new_values = []
  prev_values.each.with_index do |cell, index|
    left_neighbor = index.zero? ? 0 : prev_values[index - 1]
    right_neighbor = index == prev_values.length - 1 ? 0 : prev_values[index + 1]
    new_values << (left_neighbor == right_neighbor ? 0 : 1)
  end

  new_values
end

p cycle_cells([1, 0, 0, 0, 0, 1, 0, 0], 1)
p cycle_cells([1, 1, 1, 0, 1, 1, 1, 1], 2)
