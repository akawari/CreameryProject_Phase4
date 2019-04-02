class StaticController < ApplicationController
    def showa
        render "static/aboutus"
    end
    
    def showc
        render "static/contactus"
    end
end
