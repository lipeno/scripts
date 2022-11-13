=begin
I have an array stockPricesYesterday where the keys are the number of minutes into
the day (starting with midnight) and the values are the price of Apple stock at that time.
For example, the stock cost $500 at 1am, so stockPricesYesterday[60] = 500.
Write an efficient algorithm for computing the best profit I could have made from 1 purchase
and 1 sale of an Apple stock yesterday.
=end

def bestProfit input
  max_profit = 0
  min_price = 1000000

  input.each do |element|
    price = element[1]
    if price < min_price
      min_price = price
    end
    max_profit = price - min_price

  end

  max_profit
end

stockPricesYesterday = {}
stockPricesYesterday[60] = 500
stockPricesYesterday[120] = 300
stockPricesYesterday[180] = 600
puts bestProfit stockPricesYesterday