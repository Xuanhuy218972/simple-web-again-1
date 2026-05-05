module Frack
    class Application
        class << self
            attr_accessor :env
            def call(env)
                self.env = env
                response = dispatch
                if response.is_a?(Array)
                  response
                else
                  [200, { "content-type" => "text/html" }, [response]]
                end
            end
            
            def dispatch
                controller.new(env).public_send(env["action"])
            end
        
            def controller
                Object.const_get(env["controller"].capitalize + "Controller")
            end
        end
    end
end