#1. Extract major NOUNS into classes

#2. Identify behaviors of those nouns, and extract as methods.

#3. See if you can move common behaviors to a subclass or module, depending on if it's a "is a" or "has a" relationship.

#Inheritance v.s. Composition

#see if you can move common behaviors to a superclass or module, depending on

#1. "is a" relationship, use inheritance (Dog is an animal)
#2.  "has a " relationship, use composition (Dog has ability to fly)

Card
  -states
      -suits, value
  -behaviors
      -print out its value and suit

Deck
  -states
      -cards (array of card object?)
  -behaviors
      -empty?, shuffle!? how_many_left?, do_calc, deal, play_again? new_deck

Player
  -states
      -number of players, name, chips, 2 cards,
  -behaviors
      -blackjack, hit, stay, busted, win, loss, draw, split

Dealer
  -states
      -name, 2 cards, not qualified
  -behaviors
      -blackjack, hit, stay, busted, win, loss, draw,


The engine
- orchestrates the objects to form the application

- where we’re using the classes

-more procedural

e.g.

class Card
face_vale, suit
show_card

class Deck
  52 cards
shuffle, deal, check how many left

module hand
  show card
  add card
  calc total
  check if busted

class Player

class Dealer
  show flop

class Blackjack

def start
get_name
initial_cards
show_cards
blackjack_or_busted
player_turn
dealer_turn
who_won?
play_again?

end

game = Blackjack.new
game.start