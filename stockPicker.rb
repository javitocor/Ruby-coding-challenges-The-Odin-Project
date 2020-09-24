def stock_picker(arr)
  profit = []
  value = 0
  i = 0
  while i < arr.length - 2     
    j = i + 1
    while j < arr.length - 1
      num = arr[j] - arr[i]
      if num > value 
        profit[0] = i
        profit[1] = j 
        value = num       
      end
      j += 1
    end
    i += 1
  end
  return profit
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# [1,4]