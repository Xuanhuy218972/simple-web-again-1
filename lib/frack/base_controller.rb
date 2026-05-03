require 'erb'

module Frack
    class BaseController
        attr_reader :env

        def initialize(env)
            @env = env
        end

        def render(view_name)
            path = "app/views/#{controller_name}/#{view_name}.html.erb"
            template = File.read(path)
            ERB.new(template).result(binding)
        end

        private

        def controller_name
            self.class.name.gsub("Controller", "").downcase
        end
    end
end