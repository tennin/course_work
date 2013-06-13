class Card

  attr_accessor :suit, :face_value

  def initialize(s, fv)
    @suit = s
    @face_value = fv
  end

  def display_card
    "The #{@face_value} of #{find_suit}"
  end

  def to_s
    display_card

  end

  def find_suit
    ret_val = case suit
                      when 'H' then 'Heart'
                      when 'D' then 'Diamond'
                      when 'S' then 'Spade'
                      when 'C' then 'Club'

                    end
    ret_val
  end
end


class Deck
  attr_accessor :cards
  def initialize ()
    @cards = []
    ['S','H','D','C'].each do |suit|
      ['A','2','3','4','5','6','7','8','9','10','J','Q','K'].each do | value|
        @cards << Card.new(suit, value)
      end
    end
    shuffle!
  end

  def deal_one
    cards.pop
  end

  def shuffle!
    cards.shuffle!
  end

  def length
    cards.length
  end

end


module Hand

  def show_card
    puts "======#{name}'s hand:======"

    cards.each  do |card|
      puts card
      #puts card.face_value
    end
    puts "with total of #{total}"

  end


  def add_card(new_card)
    cards << new_card
  end

  def total
    value = cards.map{|card| card.face_value}

    total = 0
    value.each do |v|
      if v == 'A'
          total = total + 11
      elsif v.to_i == 0
          total = total + 10
      else
          total = total + v.to_i
      end
    end


          value.select{|v|v=='A'}.count.times do
              total = total - 10
          end
    total
  end

  def is_busted?
    total > Blackjack:: BLACKJACK_VALUE
  end

end


class Player
  include Hand
attr_accessor :cards, :name

  def initialize (n)
    @name = n
    @cards = []
  end

end

class Dealer
  include Hand
  attr_accessor :cards, :name
  def initialize
    @name = 'Dealer'
    @cards = []
  end

  def show_flop
    puts "====Dealer's hand====="
    puts "first card is hiddden"
    puts "Second card is #{cards[1]}"
  end

end


class Blackjack

  BLACKJACK_VALUE = 21
  DEALER_MIN = 17

  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new("player1")
    @dealer = Dealer.new
  end

  def get_name
    puts "What is your name?"
    player.name = gets.chomp
  end

  def initial_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end

  def show_cards
    player.show_card
    dealer.show_flop
  end

  def blackjack_or_busted?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_VALUE
      if player_or_dealer.is_a?(Player)
        puts "Congratulation, #{player.name} hit a blackjack"
      else
        puts "Sorry, dealer hit a blackjack, #{player.name} lose"
      end
      play_again?

    elsif player_or_dealer.total > BLACKJACK_VALUE
      if player_or_dealer.is_a?(Player)
        puts "Sorry, #{player.name} is busted with total of #{player.total}"
      else
        puts "Congratulation!  Dealer is busted with total of #{dealer.total}, #{player.name} wins"
      end
      play_again?
    end
  end

  def player_turn

    puts "=====#{player.name}'s turn====="

    blackjack_or_busted?(player)
    while !player.is_busted?
      puts "What would you like to do?  press 1 to hit and 2 to stay"
      response = gets.chomp

        if !['1','2'].include?(response)
          puts "Err...please enter either '1' or '2'..."
          next
        end

        if response == '2'
          puts "#{player.name} chose to stay"
          break
        end

        new_card = deck.deal_one
        "Dealing another card to #{player.name}:  #{new_card}"
        player.add_card(new_card)

        puts "========="
        player.show_card

        blackjack_or_busted?(player)

    end
    puts "#{player.name} stays at #{player.total}"
  end

  def dealer_turn

    puts "=====Dealer's turn======="
    blackjack_or_busted?(dealer)
    while dealer.total < DEALER_MIN

      new_card = deck.deal_one
      puts "Dealing another card: #{new_card}"
      dealer.add_card(new_card)




        blackjack_or_busted?(dealer)
    end
    dealer.show_card
    puts "Dealer stays at #{dealer.total}"
  end

  def who_won?
    if player.total > dealer.total
      puts "Congratulation, #{player.name} wins #{player.total} over #{dealer.total}"
    elsif player.total < dealer.total
      puts "Ooops, dealer wins #{dealer.total} over #{player.total}"
    else
      puts "That's a draw, try again!!"
    end
    play_again?
  end

  def play_again?
    puts "Would you like to play again? press 1 for yes and 2 for exit"
    response = gets.chomp

    if !['1','2'].include?(response)
      puts "Error!!  You must choose between 1 or 2"

    end

    if response == '2'
      puts "Goodbye, #{player.name}"
      exit
    else response == '1'
        puts
        puts
        puts
        puts "Starting with new deck of cards"
        deck = Deck.new
        player.cards = []
        dealer.cards = []
        start
    end
  end


  def start
    get_name
    initial_cards
    show_cards
    player_turn
    dealer_turn
    who_won?
    play_again?
  end

end

game = Blackjack.new
game.start