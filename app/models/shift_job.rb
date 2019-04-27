class ShiftJob < ApplicationRecord
  include CreameryHelpers::Validations
  
  # Relationships
  belongs_to :shift
  belongs_to :job
  
  # Validations
  validates_presence_of :shift_id, :job_id
  validate :shift_is_active_in_system, on: :create
  validate :job_is_active_in_system, on: :create

  #Scopes
  scope :for_shift, ->(shift_id) { where("shift_id = ?", shift_id) }

  private  
  
  def shift_is_active_in_system
    is_active_in_system(:shift)
  end

  def job_is_active_in_system
    is_active_in_system(:job)
  end
end
