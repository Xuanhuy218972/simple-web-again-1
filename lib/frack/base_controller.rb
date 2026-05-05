require 'tilt'
require 'erubi'

module Frack
  class BaseController
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def request
      @request ||= Rack::Request.new(env)
    end

    def session
      request.session
    end

    def current_user
      @current_user ||= User.find_by(id: session['user_id']) if session['user_id']
    end

    def render(view)
      view_path = view.include?("/") ? view : "#{controller_name}/#{view}"
      render_template('layouts/application') do
        render_template(view_path)
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
