class HistoriesController < ApplicationController
  before_action :require_login, only: [:show, :lend]
  def show
    @lender = Lender.find(session[:lender_id])
    @borrowers = Borrower.all
    @amt_raised = History.select(:amount).all
    @partners = Lender.joins(:histories).joins(histories: :borrower).select(:id, :amount, "borrowers.id as borrower_id", "histories.id as history_id", :f_name, :l_name, :funds, :purpose, :description).all
    render 'show'
  end

  def lend
    if History.where(lender: Lender.find(session[:lender_id]), borrower: Borrower.find(params[:id])).last
      @loan = History.where(lender: Lender.find(session[:lender_id]), borrower: Borrower.find(params[:id])).last
      @loan.amount = params[:funds]
      @needed = Borrower.find(params[:id]).funds
      @borrower = Borrower.find(params[:id])
      @borrower.decrement(:funds, by = @loan.amount)
      @borrower.save
      # @lent = Lender.find(session[:lender_id]).joins(:histories).joins(histories: :borrower).select(:money, :amount, :funds)
      # @lent = History.where(lender: @lender, borrower: @borrower).joins(:lender).joins(lender: :borrower).select(:amount, :funds, :money).find(@loan.id)
      @lender = Lender.find(session[:lender_id])
      @lender.decrement(:money, by = @loan.amount)
      @lender.save
      @raised = History.find(@loan.id)
      @raised.increment(:amount, by = @loan.amount)
      @raised.save
      redirect_to :back
      puts @raised.amount
    else
      @loan = History.create(lender: Lender.find(session[:lender_id]), borrower: Borrower.find(params[:id]), amount: params[:funds])
      @needed = Borrower.find(params[:id]).funds
      @borrower = Borrower.find(params[:id])
      @borrower.decrement(:funds, by = @loan.amount)
      @borrower.save
      # @lent = Lender.find(session[:lender_id]).joins(:histories).joins(histories: :borrower).select(:money, :amount, :funds)
      # @lent = History.where(lender: @lender, borrower: @borrower).joins(:lender).joins(lender: :borrower).select(:amount, :funds, :money).find(@loan.id)
      @lender = Lender.find(session[:lender_id])
      @lender.decrement(:money, by = @loan.amount)
      @lender.save
      @raised = History.find(@loan.id)
      @raised.increment(:amount, by = @loan.amount)
      @raised.save
      redirect_to :back
      puts @raised.amount

    end
  end
end
