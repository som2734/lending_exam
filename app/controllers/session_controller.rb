class SessionController < ApplicationController
  def new
  end

  def create
   @lender = Lender.find_by_email(params[:email])
   @borrower = Borrower.find_by_email(params[:email])
    if @lender && @lender.authenticate(params[:password])
       session[:lender_id] = @lender.id
       #  redirect_to "/users/#{session[:user_id]}"
       redirect_to "/online_lending/lender/#{session[:lender_id]}"
    elsif @borrower && @borrower.authenticate(params[:password])
       session[:borrower_id] = @borrower.id
       #  redirect_to "/users/#{session[:user_id]}"
       redirect_to "/online_lending/borrower/#{session[:borrower_id]}"
    else
       flash[:notice] = "Information provided does not match our records, please register or enter correct information."
       redirect_to '/online_lending/login'
    end
  end

  def destroy
    session[:lender_id] = nil if session[:lender_id]
    session[:borrower_id] = nil if session[:borrower_id]
    redirect_to '/online_lending/login'
  end
end
