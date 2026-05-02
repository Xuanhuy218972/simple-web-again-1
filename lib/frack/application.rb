require_relative "router"

module Frack
    class Application
        def call(env)
            path = env["PATH_INFO"]
            handler = Router.new.route(path)

            [200, { "content-type" => "text/plain" }, ["Routing to: #{handler}"]]
        end
    end
end