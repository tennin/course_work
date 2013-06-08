require 'pry'
require 'pry-debugger'

$deck = [1,2,3,4,5,6,7,8,9,10,'J','Q','K'].shuffle
#$deck = [1,1,2,4,1,'J','10','Q','J',10,'J','Q','K'].shuffle

#puts
#print $deck
#puts

def deal_card arr, new_arr
card = arr.shift
new_arr.push card
new_arr
end

def do_calc(cards)
	total = 0
	#arr = cards.map{|e| e[1] }
	cards.each do |value|
		if value.to_i == 1
			total = total + 11
		elsif value.to_i == 0
			total = total + 10
		else
			total = total + value.to_i
		end	
	end

#correct for 1
	cards.select{|v|v == 1}.count.times do
		if total > 21
			total = total - 10
		end
	end

#	if cards.include?(1) && total > 21
#			total = total - 10
#		end	

	total
end

player_card = []
dealer_card = []
player_index = 0
dealer_index = 0
player_sum = 0
dealer_sum = 0
player_busted = false
dealer_busted = false


player_card = deal_card($deck, player_card)
dealer_card = deal_card($deck, dealer_card)
player_card = deal_card($deck, player_card)
dealer_card = deal_card($deck, dealer_card)

puts
print 'player has :'
print player_card
puts
#print 'dealer has    '
#print dealer_card
#puts



player_sum = do_calc(player_card)
#dealer_sum = do_calc(dealer_card)

if player_sum == 21
	puts 'Congratulations, you hit a Black Jack'
	puts 'Dealer\'s turn now!'
else
	puts "You have #{player_sum} !!"

	while $deck.length != 0
		
		  puts 'Do you want to draw another card?  yes or no'
		  reply = gets.chomp
		  if reply == 'yes'
				print player_card = deal_card($deck, player_card)
				puts
				player_sum = do_calc(player_card)

				puts "Now you have #{player_sum}...."

				if player_sum > 21
					puts 'Busted'
					player_busted = true
					break
				end

			elsif reply == 'no'
				puts "You stays at #{player_sum}"
				puts
				puts 'Dealer\'s turn now!!'
				break
			end
			 
	end
end


while $deck.length != 0 && dealer_sum < 17 &&  player_busted == false
	puts
	print 'Dealer has  '
	print dealer_card
	puts

	puts 'Dealer draws another card:'

	print dealer_card = deal_card($deck, dealer_card)
	puts
	dealer_sum = do_calc(dealer_card)

	puts "dealer has #{dealer_sum}"
	if dealer_sum > 21
		puts 'busted'
		dealer_busted = true
	else
		puts "Dealer stays at #{dealer_sum}"
	end

end

puts
puts


if player_busted == true
	puts 'You loss'
else
	if dealer_busted == true
		puts 'You win'
	else
		if player_sum == dealer_sum
			puts ' Even, try again'
		elsif player_sum < dealer_sum
			puts 'You Loss'
		else
			puts 'You Win'

		end

	end
end


#black jack should win straight away
#1. Save the player's name, and use it throughout the app.
#2. Ask the player if he wants to play again, rather than just exiting.
#3. Save not just the card value, but also the suit. 
#4. Use multiple decks to prevent against card counting players.


