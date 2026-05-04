require 'tilt'
require 'erubi'

module Frack
  class BaseController
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view)
      render_template('layouts/application') do
        render_template("#{controller_name}/#{view}")
      end
    end

    def render_template(path, &block)
      template = Tilt::ErubiTemplate.new(file(path))
      template.render(self, &block)
    end

    private

    def file(path)
      File.expand_path("app/views/#{path}.html.erb")
    end

    def controller_name
      self.class.name.gsub("Controller", "").downcase
    end
  end
end
