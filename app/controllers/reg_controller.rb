class RegController < ApplicationController
  before_action :require_login, except: [:new, :lender, :borrower]
  def new
    render 'new'
  end

  def lender
    @lender = Lender.new(lender_params)
    if @lender.save
      redirect_to '/online_lending/login'
    else
      flash[:errors] = @lender.errors.full_messages
      flash[:notice] = "Insufficient funds"
      redirect_to :back
    end
  end

  def borrower
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      redirect_to '/online_lending/login'
    else
      flash[:errors] = @borrower.errors.full_messages
      redirect_to :back
    end
  end

  private
    def lender_params
      params.require(:lender).permit(:fname, :lname, :email, :password, :password_confirmation, :money)
    end
    def borrower_params
      params.require(:borrower).permit(:f_name, :l_name, :email, :password, :password_confirmation, :purpose, :description, :funds)
    end
end
