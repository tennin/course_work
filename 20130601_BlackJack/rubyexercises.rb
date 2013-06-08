array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 1
array.each do | element|
	print "#{element} "
end

puts
# 2

array.each do | element|
	print "#{element} " if element > 5
end

puts
# 3
puts '-----'
puts array.select {|n| n.odd?}
puts '-----'

array.select do |n|
	if n.odd?
	 	print "#{n} "
	 end
end

puts


# 4
print array << 11
puts
print array.unshift(0)
#puts array.pop
puts
# 5
array.delete(11)
print array
array.push 3
puts
print array
puts
# 6
array.uniq!
print array
puts
# 7
puts 'Arrays are for keeping things in order; '
puts 'Hashes are for keeping things referenced by other things'

#8
# Ruby 1.8 Syntax
hash_18 = {:name => 'Tennin', :age => 36}
puts hash_18
# Ruby 1.9 syntax

hash_19 = {residence: 'Taiwan', zipcode: '244'}
puts hash_19

h = {a:1, b:2, c:3, d:4}

#9
puts h[:b]
#symbol b

#10
puts h.update(e:5)
#or h[:e] = 5

#13
puts h.delete_if {|key, value| value < 3.5}
#or
#h.delete_if do |key, value|
#	value < 3.5
#end

#puts h

#14, array in hash
puts arr_in_hash = {a:1, b:2, c:[5,6,7]}

#hash in array
print hash_in_array = [{a:1, b:2},{c:3, d:4},{e:5}]
puts