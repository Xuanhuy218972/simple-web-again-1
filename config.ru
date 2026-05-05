$LOAD_PATH.unshift << File.expand_path('lib', __dir__)
require "frack"
require "rack/session"
require_relative "app/controllers/home_controller"
require_relative "app/controllers/users_controller"
require_relative "app/controllers/sessions_controller"

use OTR::ActiveRecord::ConnectionManagement
use Rack::Session::Cookie, secret: "d1de9ec5b1ab4b913456d1547db353fc4f4a3b76f92a16b77303f607b0630e10"

run Frack::Router.new(Frack::Application) {
    get "/"        => "home#show"
    get "/signup"  => "users#new"
    post "/signup" => "users#create"
    get "/signout" => "sessions#destroy"
}