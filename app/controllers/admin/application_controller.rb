module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorize_admin

    private

    def authorize_admin
      authenticate_user!
      redirect_to root_path, status: 301 unless current_user.admin?
    end
  end
end