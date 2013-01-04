class ExpensesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@expenses = current_user.expense
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
	end
end