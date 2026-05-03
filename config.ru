$LOAD_PATH.unshift << File.expand_path('lib', __dir__)
require "frack"
require_relative "app/controllers/home_controller"
require_relative "app/controllers/users_controller"

run Frack::Router.new(Frack::Application) {
    get "/"      => "home#show"
    get "/users" => "users#new"
}