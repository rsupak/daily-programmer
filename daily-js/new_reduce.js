var orders = [
  {
    amount: 250
  },
  {
    amount: 400
  },
  {
    amount: 100
  },
  {
    amount: 325
  },
]

var totalAmount = orders.reduce((sum, order) => sum + order.amount, 0)
console.log(totalAmount)
