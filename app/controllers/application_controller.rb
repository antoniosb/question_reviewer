class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authenticate_user!
    unless current_user.present? && current_user.user?
      sign_out current_user
      authenticate_user!
    end
  end

  protected

  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_questions_path : questions_path
  end
end
