# require_relative "view.rb"

class Game

  attr_reader :filename
  attr_accessor :cards, :current_card, :question

  def initialize(cards_file)
    @cards = []
    @filename = cards_file
    @question= nil
    @current_card = nil

  end

  def get_csv_data

   qa_array = IO.readlines(filename)
   qa_array.select! { |l| l != "\n"}
   qa_array.each_slice(2) do |r| 
    cards << Card.new(:question => (r[0]).gsub("\n", ""), :answer => (r[1]).gsub("\n", ""))
  end
  cards
end

def generate_question
  rand_length = rand(0..cards.length)
  cards.each do |card|
    if card.id == rand_length
      self.current_card = card
      self.question = card.question
   end
 end
end

def correct_answer?(answer)
  self.current_card.answer == answer ? true : false

end

def update_card_info
    self.current_card.solved = true
    self.current_card.attempts +=1
  end
end

class Card

 @@card_id = 0

 attr_accessor :solved, :attempts
 attr_reader :question, :answer, :id

 def initialize(args)
  @question = args[:question]
  @answer = args[:answer]
  @solved = false
  @id = (@@card_id+=1)
  @attempts = 0
  
end

end

game = Game.new('flashcard_samples.txt')
game.get_csv_data
game.generate_question
p game.correct_answer?("BEGIN")
