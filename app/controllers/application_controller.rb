class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    redirect_to '/online_lending/login' if session[:borrower_id] == nil && session[:lender_id] == nil
  end
  def current_user
   Lender.find(session[:lender_id]) if session[:lender_id] || Borrower.find(session[:borrower_id]) if session[:borrower_id]
  end

  # def require_correct_user
  #   user = User.find(params[:id])
  #   redirect_to "/users/#{current_user.id}" if current_user != user
  # end

  helper_method :current_user, :require_login
end
