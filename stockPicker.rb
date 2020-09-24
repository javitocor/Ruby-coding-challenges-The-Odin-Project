def stock_picker(arr)
  profit = []
  max = 0
  buy = 0
  while buy < arr.length - 2     
    sell = buy + 1
    while sell < arr.length - 1
      num = arr[sell] - arr[buy]
      if num > max 
        profit[0] = buy
        profit[1] = sell
        max = num       
      end
      sell += 1
    end
    buy += 1
  end
  return profit
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# [1,4]