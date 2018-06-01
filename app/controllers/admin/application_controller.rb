module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_admin!

    def authenticate_admin!
      unless current_user.present? && current_user.admin?
        sign_out current_user
        authenticate_user!
      end
    end
  end
end