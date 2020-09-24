def bubble_sort(array)
  array_length = array.length
  array_length.times do |n|
    (array_length - n - 1).times do |m|
      next unless array[m] > array[m + 1]

      first_num = array[m]
      second_num = array[m + 1]
      array[m] = second_num
      array[m + 1] = first_num
    end
  end
  array
end

puts bubble_sort([4,3,78,2,0,2])
# [0,2,2,3,4,78]