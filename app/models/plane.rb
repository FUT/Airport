class Plane < ActiveRecord::Base
  PERCENTAGE_PER_LAUNCH = 10

  attr_accessible :name, :launched_percentage

  validates :name, presence: true
  validates :launched_percentage, numericality: { greater_than_or_equal_to: 0, less_then_or_equal_to: 100 }

  scope :not_launched, -> { where { launched_percentage < 100 } }
  scope :launched, -> { where { launched_percentage == 100 } }

  scope :by_creation, -> { order 'created_at DESC' }
  scope :by_lauch, -> { order 'updated_at DESC' }

  def launch!
    self.launched_percentage += PERCENTAGE_PER_LAUNCH
    save
  end

  def launched?
    launched_percentage == 100
  end
end
