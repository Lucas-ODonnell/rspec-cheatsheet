RSpec.describe 'be matchers' do
  it 'can test for truthiness' do
    expect(true).to be_truthy
    expect('hello').to be_truthy
    expect(12).to be_truthy
    expect([1, 2, 3]).to be_truthy
  end

  it 'can test for falsey' do
    expect(nil).to be_falsy
    expect(false).to be_falsy
  end

  it 'can test for nil' do
    expect(nil).to be_nil
  end
end
