module BigCartel
  class Browser
    module ActionController # :nodoc: all
      def self.included(base)
        base.send :helper_method, :browser
      end

      private
      def browser
        @browser ||= Browser.new(
          :accept_language => request.headers["Accept-Language"],
          :ua => request.headers["User-Agent"]
        )
      end
    end
  end
end
ActionController::Base.send :include, BigCartel::Browser::ActionController
