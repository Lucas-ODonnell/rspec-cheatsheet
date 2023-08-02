RSpec.describe 'satisfy matcher' do
  subject { 'racecars' }
  it 'is a palindrome' do
    expect(subject).to(satisfy { |value| value == value.reverse }) # not optimal
  end

  it 'can accept a custom error message' do
    expect(subject).to satisfy('be a palindrome') { |value| value == value.reverse }
  end
end

#     Failure/Error: expect(subject).to satisfy('be a palindrome') { |value| value == value.reverse }
#       expected "racecars" to be a palindrome
#
# This shows how the string argument appears in a failing test
