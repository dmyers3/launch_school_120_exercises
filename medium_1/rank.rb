class Card
  CARD_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  
  attr_reader :rank, :suit
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = value
  end
  
  def <=>(other_card)
    value <=> other_card.value
  end
  
  def value
    if CARD_VALUES.keys.include?(rank)
      CARD_VALUES[rank]
    else
      rank
    end
  end
  
  def to_s
    "#{rank.to_s} of #{suit}"
  end
  
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    reshuffle
  end
  
  def draw
    drawn_card = @deck.pop
    reshuffle if @deck.size == 0
    drawn_card
  end
  
  def reshuffle
    @deck = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end
  
end

class PokerHand
  HAND_SIZE = 5
  
  def initialize(deck)
    @hand = []
    HAND_SIZE.times { @hand << deck.draw }
  end

  def print
    @hand.each { |card| puts card }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
    flush = false
    Deck::SUITS.each do |suits|
      flush = true if @hand.count { |card| card.suit == suits } == 5
    end
    flush
  end

  def straight?
    
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
  end
end


hand = PokerHand.new(Deck.new)
hand.print

class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])

hand.print
puts hand.evaluate
