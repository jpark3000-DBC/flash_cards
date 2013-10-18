require_relative "flashcards"
require 'debugger'

class Console
  attr_reader :current_game
  def initialize(deck)
    @current_game = Game.new(deck)


  end

  def get_question
     @current_game.generate_question
  end

  def answer
    gets.chomp
  end

  def challenge
    if @current_game.correct_answer?(self.answer) == true
      @current_game.update_card_info
      return true
    end
  end
end

deck = Console.new('flashcard_samples.txt') #or ARGV[0])

while true
  puts deck.get_question
  while true
    print ">> "; break if deck.challenge
  end
end

# game.get_question
# game.challenge
# until game.correct_answer





























#   def get_question


#   end


# end



# these_cards = Console.new

# ### sketching

# def correct?(answer, card_id)
#   @cards.detect { |card| card.id == card_id}.answer == answer
# end

# def get_q_a
#   current_q = generate_question
#   # SHOW USER current_q
#   answer = #prompts for answer
#   correct?(answer, current_q) #=> true/false
#   # adjusts true count on
# end




