class BorrowerController < ApplicationController
  before_action :require_login, only: [:show]
  def show
    @borrower = Borrower.find(session[:borrower_id])
    @lenders = Borrower.where(id: params[:id]).joins(:histories).joins(histories: :lender).select(:id, :funds, :amount, "lenders.id as lender_id", "histories.id as history_id", :fname, :lname, :email).all
    # @lent_amt = Borrower.funds
    render 'show'
  end
end
