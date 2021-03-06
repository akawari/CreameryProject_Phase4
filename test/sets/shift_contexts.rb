module Contexts
  module ShiftContexts
    
    def create_shifts
  	  @current_shift = FactoryBot.create(:shift)
  	  @future_shift = FactoryBot.create(:shift, date: Date.current + 5, start_time: Date.current + 3.hours)
    end

  	def remove_shifts
  	  @current_shift.destroy
  	  @future_shift.destroy
  	end

  end
end