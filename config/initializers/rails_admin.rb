require "rails_admin/application_controller"

module RailsAdmin
  class ApplicationController < ::ApplicationController
    #load_and_authorize_resource
    config.Model Job do
      show_in_navigation 
    end
  end
end
