class Plane < ActiveRecord::Base
  PERCENTAGE_PER_LAUNCH = 10

  attr_accessible :name, :launched_percentage

  validates :name, presence: true
  validates :launched_percentage, numericality: { greater_than_or_equal_to: 0, less_then_or_equal_to: 100 }

  scope :not_launched, -> { where { state != 'in_the_air' } }
  scope :launched, -> { where { state == 'in_the_air' } }

  scope :by_creation, -> { order 'created_at DESC' }
  scope :by_lauch, -> { order 'updated_at DESC' }

  state_machine :state, initial: :on_the_ground do
    event :be_ready do
      transition on_the_ground: :waiting
    end

    event :launch do
      transition waiting: :launching
    end

    event :launched do
      transition launching: :in_the_air
    end

    after_transition on: :be_ready do |plane|
      PlaneLauncher.perform_async plane.id
    end
  end

  def launch!
    self.launched_percentage += PERCENTAGE_PER_LAUNCH
    save
  end

  def launched?
    launched_percentage == 100
  end
end
