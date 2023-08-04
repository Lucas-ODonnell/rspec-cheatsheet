class Car
  def initialize(model)
    @model = model
  end
end

class Garage
  attr_reader :storage

  def initialize
    @storage = []
  end

  def add_to_collection(model)
    @storage << Car.new(model)
  end
end

RSpec.describe Garage do # all dependencies on the car should be separate
  let(:car) { instance_double(Car) }
  before do # doing this makes a spy
    allow(Car).to receive(:new).and_return(car)
  end

  it 'adds a car to its storage' do
    subject.add_to_collection('Honda Civic') # calling add_to_collection method
    expect(Car).to have_received(:new).with('Honda Civic') # this triggered the car spy
    expect(subject.storage.length).to eq(1) # @storage has a car in it now
    expect(subject.storage.first).to eq(car) # the car in it is our spy
    # we have isolated the Garage tests from the Car tests that theoretically are somewhere else.
  end
end
