class HomeController < Frack::BaseController
    def show
        @name = "Student" # Data giả
        render "show"
    end
end