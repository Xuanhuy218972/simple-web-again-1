module Frack
    class Router
        attr_reader :routes, :app
        def initialize(app, &block)
            @app    = app
            @routes = {}
            instance_eval(&block) if block_given?
        end

        def call(env)
            path = env['PATH_INFO']
            http_method = env['REQUEST_METHOD']
            if mapping = routes[path + http_method] 
                env.merge!(controller_action(mapping))
            app.call(env)
            else
                [404, {'content-type' => 'text/plain'}, ['Not Found']]
            end
        end

        def controller_action(mapping)
            controller, action = mapping.split('#')
            {"controller" => controller, "action" => action}
        end

        def get(route)
            path, mapping = route.first
            routes[path + "GET"] = mapping
        end
    end
end