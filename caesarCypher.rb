def caesar_cipher(string, number)  
  array2 = string.bytes.map do |x| 
    if x >= 65 && x <= 90
      (((x - 65 + number) % 26) + 65).chr
    elsif x >= 97 && x <= 122
      (((x - 97 + number) % 26) + 97).chr
    else 
      x.chr
    end
  end
  return array2.join('')
end

puts caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"