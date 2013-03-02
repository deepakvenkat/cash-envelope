class UnusualExpensesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @uexpenses = current_user.unusual_expenses
  end

  def edit
    @uexpenses = current_user.unusual_expenses.find(params[:id])
    if @envelope.blank?
      flash[:error] = "Expense not found"
    end
  end

  def update
  end

  def create
    user = current_user
    user.unusual_expenses.build(params[:unusual_expenses])
    if user.save
      redirect_to unusual_expenses_path
    else
      flash[:error] = user.errors
      render 'new'
    end

  end

  def new
    @envelope = UnusualExpense.new
  end

  def destroy
    @envelope = Envelope.find(params[:id])
    if @envelope.destroy
      flash[:alert] = "Envelope deleted"
    else
      flash[:error] = "Error deleting envelope"
    end
    redirect_to envelopes_path
  end
end