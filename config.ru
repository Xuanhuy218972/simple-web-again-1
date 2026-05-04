$LOAD_PATH.unshift << File.expand_path('lib', __dir__)
require "frack"
require_relative "app/controllers/home_controller"

use OTR::ActiveRecord::ConnectionManagement
run Frack::Router.new(Frack::Application) {
    get "/"      => "home#show"
    get "/users" => "users#new"
}