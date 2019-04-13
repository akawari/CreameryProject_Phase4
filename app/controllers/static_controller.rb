class StaticController < ApplicationController
    def showa
        render "static/aboutus"
    end
    
    def showc
        render "static/contactus"
    end
    
    def showh
        render "static/home"
    end
    
    def showp
        render "static/privacy"
    end
end
