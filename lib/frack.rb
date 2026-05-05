require "active_record"
require "pg"
require "otr-activerecord"
require "dotenv/load"

OTR::ActiveRecord.configure_from_file! './config/database.yml'
OTR::ActiveRecord.establish_connection!

# Load all models
Dir[File.expand_path('../app/models/*.rb', __dir__)].each do |file|
  require file
end

module Frack
  autoload :Application,    'frack/application'
  autoload :Router,         'frack/router'
  autoload :BaseController, 'frack/base_controller'
end