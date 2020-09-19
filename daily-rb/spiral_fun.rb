require 'ruby2d'

# Set the window size
set width: 500, height: 500

# Create a new shape
s = Square.new(
  x: 100, y: 200,
  size: 50,
  color: 'blue',
  z: 10
)

# Give it some color
s.color = 'red'

# Show the window
show


