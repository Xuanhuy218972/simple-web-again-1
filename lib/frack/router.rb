module Frack
    class Router
        def initialize
            @routes = {
                "/" => "HomeController#show",
                "/users/new" => "UsersController#new",
            }
        end

        def route(path)
            @routes[path]  || "404 Not Found"
        end
    end
end