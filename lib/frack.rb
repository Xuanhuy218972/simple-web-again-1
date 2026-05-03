require "active_record"
require "pg"
require "otr-activerecord"

OTR::ActiveRecord.configure_from_file! './config/database.yml'
OTR::ActiveRecord.establish_connection!

module Frack
  autoload :Application,    'frack/application'
  autoload :Router,         'frack/router'
  autoload :BaseController, 'frack/base_controller'
end