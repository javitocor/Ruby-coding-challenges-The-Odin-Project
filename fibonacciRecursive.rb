def fibs(n)
  first_num = 0
  second_num = 1
  n.times do
    first_num, second_num = second_num, first_num + second_num
  end
  first_num
end

def fibs_rec(n)
  return 0 if n == 0
  return 1 if n == 1
  fibs_rec(n-1) + fibs_rec(n-2) 
end

puts fibs(9) # 34
puts fibs(10) # 55
puts fibs_rec(9) # 34
puts fibs_rec(10) # 55