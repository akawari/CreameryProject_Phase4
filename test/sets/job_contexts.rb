module Contexts
  module JobContexts
    
    def create_jobs
 	  @mopper = FactoryBot.create(:job, name: "Mopper", description: "Cleaned the floor", active: 0)
 	  @cashier = FactoryBot.create(:job)
    end

  	def remove_jobs
  	  @mopper.destroy
  	  @cashier.destroy
  	end
  end
end