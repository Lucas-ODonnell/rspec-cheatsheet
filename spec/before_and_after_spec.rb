RSpec.describe 'before and after hooks' do
  before do
    puts 'Before each'
  end

  after do
    puts 'After each'
  end
  it 'foo' do
    expect(5 * 4).to eq(20)
  end

  it 'bar' do
    expect(3 - 2).to eq(1)
  end
end
