class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize_user
  skip_before_action :authorize_user, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    current_user.try(:admin?) ? admin_questions_path : questions_path
  end

  def authorize_user
    authenticate_user!
    redirect_to root_path, alert: 'Not authorized.' unless current_user.user?
  end
end
