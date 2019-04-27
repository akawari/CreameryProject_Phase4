require 'test_helper'

class StoreFlavorTest < ActiveSupport::TestCase
  #Test Relationships
  should belong_to(:store)
  should belong_to(:flavor)
end
