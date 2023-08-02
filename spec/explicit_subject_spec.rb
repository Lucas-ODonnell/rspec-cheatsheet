RSpec.describe Hash do
  subject do
    { a: 1, b: 2 }
  end

  it 'has tow key value pairs' do
    expect(subject.length).to eq(2)
  end

  describe 'next example' do
    it ''
  end
end
