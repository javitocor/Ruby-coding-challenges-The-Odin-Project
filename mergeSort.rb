def merge_sort(arr)
  return arr if arr.length == 1
  return arr[0] < arr[1] ? arr : [arr[1], arr[0]] if arr.length == 2
  n = arr.length
  first = arr.slice(0, n/2)
  second = arr.slice(n/2, n - 1 )
  half = merge_sort(first)
  half2 = merge_sort(second)
  merged = merge(half, half2)
  return merged
end

def merge(left, right)
  length = left.length + right.length 
  merged = []
  length.times do 
    if left.empty?
      merged << right.shift
    elsif right.empty?
      merged << left.shift
    else
      left[0] < right[0] ? merged << left.shift : merged << right.shift
    end
  end
  return merged
end

p merge_sort([6, 7, 1, 4, 9, 3, 2, 5, 8])
# [1, 2, 3, 4, 5, 6, 7, 8, 9]