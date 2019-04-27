class Job < ApplicationRecord
  #Callbacks
  before_destroy :is_destroyable?
  after_rollback :convert_to_inactive
  
  #Relationships
  has_many :shift_jobs
  has_many :shifts, through: :shift_jobs
  
  #Validations
  validates_presence_of :name

  #Scopes
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }
  scope :alphabetical, -> { order(:name) }

  private
  def is_destroyable?
    @destroyable = self.shift_jobs.empty?
  end
  
  def convert_to_inactive
    make_inactive if !@destroyable.nil? && @destroyable == false
    @destroyable = nil
  end

  def make_inactive
    self.update_attribute(:active, false)
  end
end
