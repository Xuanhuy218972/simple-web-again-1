$LOAD_PATH.unshift << '.'
require_relative "lib/frack/application"
require_relative "lib/frack/router"
require_relative "lib/frack/base_controller"
require_relative "app/controllers/home_controller"


run Frack::Router.new(Frack::Application) {
    get "/"      => "home#show"
    get "/users" => "users#new"
}