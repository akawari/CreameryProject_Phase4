class Flavor < ApplicationRecord
  # Callbacks
  before_destroy :cancel_destroy
  after_rollback :make_inactive
  
  # Relationships
  has_many :store_flavors
  has_many :stores, through: :store_flavors

  # Validations
  validates_presence_of :name
  
  # Scopes
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }
  scope :alphabetical, -> { order(:name) }

  private
  #New Methods
  def cancel_destroy
  	return false
  end
  
  def make_inactive
  	self.active = 0
  	self.save
  end
end
