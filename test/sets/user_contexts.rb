module Contexts
  module UserContexts
    def create_users
   	  @gruberman = FactoryBot.create(:user)
    end

    def remove_users
      @gruberman.destroy
    end

  end
end