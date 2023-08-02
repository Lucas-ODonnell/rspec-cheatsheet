RSpec.describe Card do
  let(:card) { Card.new('Ace', 'Spades') }
  it 'has a rank' do
    expect(card.rank).to eq('Ace')
  end
  it 'has a suit' do
    expect(card.suit).to eq('Spades')
  end
  it 'has a rank that can change' do
    card.rank = 'Queen'
    expect(card.rank).to eq('Queen')
  end
  it 'has a custome error message' do
    comparison = 'Spades'
    expect(card.suit).to eq(comparison), "Hey, I expected #{comparison} but I got #{card.suit} instead!"
  end
end
