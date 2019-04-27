require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # Test relationships
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)

  # Test basic validations
  should validate_presence_of(:name)

  #Setup Contexts
  context "Creating a context for jobs" do
    setup do 
      create_jobs
    end
    
    teardown do
      remove_jobs
    end
    
    #Should Testing
    
    should "Show that there is one active job" do
      assert_equal 1, Job.active.size
      assert_equal ["Cashier"], Job.active.map{|i| i.name}.sort
    end

    should "Show that there is one inactive job" do
      assert_equal 1, Job.inactive.size
      assert_equal ["Mopper"], Job.inactive.map{|i| i.name}.sort
    end

    should "List the positions in alphabetical order" do
      assert_equal 2, Job.alphabetical.size
      assert_equal ["Cashier", "Mopper"], Job.alphabetical.map{|i| i.name}.sort
    end

    should "Show that job can only be deleted if the job has 
      never been worked by an employee; otherwise it is made inactive" do
      @cmu = FactoryBot.create(:store)
      @ben = FactoryBot.create(:employee, first_name: "Ben", last_name: "Sisko", role: "manager", phone: "412-268-2323")
      @ben_ass = FactoryBot.create(:assignment, employee: @ben, store: @cmu, start_date: 6.months.ago.to_date, end_date: nil, pay_level: 4)
      @shift_ben = FactoryBot.create(:shift)
      @shift_job_cash = FactoryBot.create(:shift_job, job_id: 2)

      @cashier.destroy
      assert_equal 2, Job.inactive.size
      assert_equal ["Cashier", "Mopper"], Job.inactive.map{|i| i.name}.sort
      
      @shift_job_cash.destroy
      @shift_ben.destroy
      @ben_ass.destroy
      @ben.destroy
      @cmu.destroy
    end
  end
end
