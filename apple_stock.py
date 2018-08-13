def max_profit(prices):
    max_sell = 0
    for i in range(len(prices)):
        if (i + 1 <= len(prices) - 1) and (max(prices[i+1:]) - prices[i] >= max_sell):
            max_sell = max(prices[i+1:]) - prices[i]
    return max_sell




stock_prices = [10, 7, 5, 8, 11, 9]

print(max_profit(stock_prices))