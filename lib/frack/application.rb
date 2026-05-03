module Frack
    class Application
        class << self
            attr_accessor :env
            def call(env)
                self.env = env
                body = dispatch
                [200, { "content-type" => "text/html" }, [body]]
            
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