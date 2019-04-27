module Contexts
  module FlavorContexts
    # Context for flavors 
    def create_flavors
      @vanilla = FactoryBot.create(:flavor, name: "Vanilla", active: 0)
  	  @chocolate = FactoryBot.create(:flavor)
    end

  	def remove_flavors
  	  @chocolate.destroy
  	  @vanilla.destroy
  	end
  end
end