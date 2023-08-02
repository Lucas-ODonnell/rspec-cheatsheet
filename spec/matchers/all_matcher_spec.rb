RSpec.describe 'all matcher' do
  it 'allow for aggregate checks' do
    expect([5, 7, 9]).to all(be_odd)
    expect([2, 4, 6, 8]).to all(be_even)
    expect([0, 0, 0, 0]).to all(be_zero)
    expect([5, 7, 9]).to all(be < 10)
  end

  describe [5, 7, 9] do
    it { is_expected.to all(be_odd) }
  end
end
