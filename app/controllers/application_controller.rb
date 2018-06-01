class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    admin_questions_path if current_user.admin?
    questions_path
  end
end
