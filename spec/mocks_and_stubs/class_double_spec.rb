class Deck
  def self.build
    # business logic to build cards
    # we are testing CardGame we don't care how this is implemented
  end
end

class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build
  end
end

RSpec.describe CardGame do
  it 'can only implement class methods that are defined on a class' do
    # class_double(Deck, build: %w[Ace Queen], shuffle: %w[Queen Ace])
    # rspec returns the Deck class does not implement the class method: shuffle
    #
    # If you are doing tdd and you haven't written the class you are mocking yet write the class as a string.
    # class_double('Deck')
    deck_klass = class_double(Deck, build: %w[Ace Queen]).as_stubbed_const # ensures the class double is always used

    expect(deck_klass).to receive(:build)
    subject.start
    expect(subject.cards).to eq(%w[Ace Queen])
  end
end
