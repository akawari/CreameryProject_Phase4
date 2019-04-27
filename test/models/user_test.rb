require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #Relationship Testing
  should belong_to(:employee)

  # Validating email...
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)

  should validate_uniqueness_of(:email).case_insensitive

  context "Creating a context for users" do
    setup do 
      @ed = FactoryBot.create(:employee)
      @gruberman = FactoryBot.create(:user, employee: @ed)
    end
    
    teardown do
       @ed.destroy
    end

    #Should Testing
    should "Assure that user can only be added to an active employee" do
      assert @gruberman.valid?
      @bad_user = FactoryBot.build(:user, email:"bad@example.com", employee_id: 12)
      assert !@bad_user.valid?
      @bad_user.destroy
    end

    should "Show that user is automatically deleted when employee is deleted" do
      @ed.destroy
      assert @ed.destroyed?
      assert @gruberman.destroyed?
    end

  end
end
