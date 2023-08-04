class Person
  def a(seconds)
    sleep(seconds)
    'Hello'
  end
end

RSpec.describe Person do
  describe 'regular double' do
    it 'can implement any method' do
      person = double(a: 'Hello', b: 20) # we added this random b method. This is stupid
      expect(person.a).to eq('Hello')
    end
  end

  describe 'instance double' do # verifying double
    it 'can only implement methods that are defined in the class' do
      # person = instance_double(Person, a: 'Hello', b: 20)
      # rspec returns the Person class does not implement the instance method: b
      # person = instance_double(Person)
      # allow(person).to receive(:a).with(3, 10).and_return('Hello')
      # rspec returns Wrong numbe of arguments. Expected 0, got 2
      person = instance_double(Person)
      allow(person).to receive(:a).with(3).and_return('Hello')
      expect(person.a(3)).to eq('Hello')
    end
  end
end
