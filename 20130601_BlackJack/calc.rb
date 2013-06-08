require 'pry'
require 'pry-debugger'

puts "=> What's the first number?"
num1 = gets.chomp

puts "=> What's the second number?"
num2 = gets.chomp

puts "=> what would you like to do?"
puts "=> enter 1 to add, 2 to subtract, 3 to multiply, and 4 to divide"
op = gets.chomp

result = ''
#binding.pry
if op == '1'

	result = num1.to_i + num2.to_i
	op = 'add'
end

if op == '2'
	result = num1.to_i - num2.to_i
	op = 'subtract'
end

if op == '3'
	result = num1.to_i * num2.to_i
	op = 'multiply'
end

if op == '4'
	result = num1.to_f / num2.to_f
	op = 'divide by'
end

puts "#{num1} #{op} #{num2} equals #{result}"
