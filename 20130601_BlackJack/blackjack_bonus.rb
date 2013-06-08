def new_deck
    suit = ['H', 'S', 'C', 'D']
    card = ['A', '2','3','4','5','6','7','8','9','10','J','Q','K']
  #create deck
  deck = suit.product(card) * 6
  deck.shuffle!

end


def do_calc(cards)
  value = cards.map{|v| v[1]}
  total = 0

  value.each do |s|
    if s == 'A'
      total = total + 11
    elsif s.to_i == 0
      total = total + 10
    else
      total = total + s.to_i
    end
  end

  value.select{|v|v=='A'}.count.times do
  total = total - 10
end
total
end

deck = new_deck
 #puts "Deck length = #{deck.length}"

while true

  if deck.length > 15

    player_card = []
    dealer_card = []

    puts 'Welcome to blackjack, what is your name?'
    player_name = gets.chomp

    #deal initial cards
    player_card << deck.pop
    dealer_card << deck.pop
    player_card << deck.pop
    dealer_card << deck.pop


    #calculate sum of initial cards
    player_sum = 0
    dealer_sum = 0

    player_sum = do_calc(player_card)
    dealer_sum = do_calc(dealer_card)

    puts "Hi #{player_name}, you have #{player_card.to_s} with a total of #{player_sum}"
    puts "Dealer has #{dealer_card.to_s} with a total of #{dealer_sum}"

    #ask player for action if player sum is lower than 21
    player_busted = false
    dealer_busted = false

    while player_sum <= 21
      puts "What would you like to do?  press 1 to draw another card and press 2 to stay..."
      reply = gets.chomp

      if reply == '1'
        player_card << deck.pop
        player_sum = do_calc(player_card)
        if player_sum > 21
          player_busted = true
        else
          puts "You have #{player_card} with a total of #{player_sum}"
        end

      elsif reply == '2'
        puts "You chose to stay at #{player_card} with a total of #{player_sum}"
        break

      else
        puts "You must hit either 1 or 2"
      end
    end

    #dealer's turn if player is not busted, dealer stands at 17
    if player_busted == false
      while dealer_sum <17
        dealer_card << deck.pop
        dealer_sum = do_calc(dealer_card)
          puts "Dealer has #{dealer_card} with a total of #{dealer_sum}"
        if dealer_sum > 21
          dealer_busted = true
        end
      end
    end

    if player_busted == true
      puts "Busted !!  You have #{player_card} with a total of #{player_sum}"
    elsif dealer_busted == true
      puts "Dealer is busted, you win"
    else #both dealer & player are not busted, compare the sum
      if dealer_sum == player_sum
        puts "Even !! Dealer has #{dealer_sum} and you have #{player_sum}"
      elsif dealer_sum > player_sum
        puts "Dealer wins with #{dealer_sum} over #{player_sum}"
      else dealer_sum < player_sum
        puts "You win with #{player_sum} over #{dealer_sum}"
      end
    end


  #ask if wanna play again?
  puts "#{player_name}, would you like to play again?  press q to quit and any other key to continue!"
  play_again = gets.chomp
    if play_again == 'q'
      break
    end


  else  #not enough cards
    puts "only #{deck.length} cards left in the deck, create new deck now"
    deck = new_deck

  end

end