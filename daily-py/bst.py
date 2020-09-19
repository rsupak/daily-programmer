class T:
	def __init__(self, value, left = None, right = None):
		self.value = value
		self.left = left
		self.right = right

	def __str__(self):
		return "({0}, {1}, {2})".format(str(self.value), str(self.left), str(self.right))


