class ExpensesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@expenses = current_user.expenses
	end

	def new
		@expense = Expense.new
	end

	def show
	end

	def create
		user = current_user
    user.expenses.build(params[:expense])
    if user.save
      redirect_to expenses_path
    else
      flash[:error] = user.errors
      render 'new'
    end
	end

	def update
	end

	def destroy
		 @expense = Expense.find(params[:id])
    if @expense.destroy
      flash[:alert] = "Expense deleted"
    else
      flash[:error] = "Error deleting expense"
    end
    redirect_to expenses_path
	end
end