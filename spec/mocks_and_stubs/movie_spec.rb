class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end

  def act
    'I love you'
  end

  def fall_off_ladder
    'Call my agent! No way!'
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    return unless actor.ready?

    actor.act
    actor.fall_off_ladder
    actor.light_on_fire
    actor.act
  end
end

# actor = Actor.new('Brad Pitt')
# movie = Movie.new(actor)
# movie.start_shooting

RSpec.describe Movie do
  let(:stuntman) do
    double('Mr. Danger', { ready?: true, act: 'I love you', fall_off_ladder: 'Ok, boss', light_on_fire: true })
  end
  subject { described_class.new(stuntman) } # using the stuntman double instead of the actor

  describe '#start_shooting' do
    it 'expects an actor to do 3 actions' do
      expect(stuntman).to receive(:light_on_fire).once
      # expect(stuntman).to receive(:light_on_fire).exactly(1).times
      # expect(stuntman).to receive(:light_on_fire).att_most(1).times
      expect(stuntman).to receive(:act).exactly(2).times
      # expect(stuntmant).to receive(:act).at_least(2).times
      subject.start_shooting
    end
  end
end
