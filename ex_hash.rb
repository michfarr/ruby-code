def make(key, quant, price)
  test = Hash.new{}
  test[key] = {
    "quantity"  => quant,
    "price"     => price
  }
  return test
end
main = {}
main = test

puts "1> puts hash.value
2> puts hash
3> puts hash.key
"
input = gets.chomp

if 1
  puts "#{main.value}"
elsif 2
  puts "#{main}"
elsif 3
  puts "#{main.key}"
else
  puts "nope"
end
