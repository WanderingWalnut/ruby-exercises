def stock_picker(stock_prices)
  # This reminds me of an LC easy problem I did before
  # We can use 2 pointers essentially, if sell_price < buy_price -> buy_price = sell_price
  # Otherwise update max profit and update indices

  p stock_prices
  l, r = 0,1
  puts "Starting points are #{stock_prices[l]}, #{stock_prices[r]}"

  max_profit = 0
  res = [0, 0]

  while r < stock_prices.length
    # Stock price at a future date is cheaper than what we bought at (we would make a loss selling here)
    if stock_prices[r] < stock_prices[l]
      l = r
      r += 1
    
    # Profit making day
    else
      current_profit = stock_prices[r] - stock_prices[l]
      
      # Update max profit if current profit is more
      if current_profit > max_profit
        max_profit = current_profit
        res[0], res[1] = l, r
      end
      r += 1
    end
  end
  return res
end

res = stock_picker([17,3,6,9,15,8,6,1,10])
p res