class TransactionsController < ApplicationController

  before_filter :authenticate_user!

  def index
    if params[:envelope].present?
      envelope = Envelope.find(params[:envelope])
      if params[:this_month] == true
        @transactions = current_user.envelope.transactions.this_month
      else

      end
    end
    @transactions = current_user.transactions
  end

  def new
    @envelope = current_user.envelopes.find(params[:envelope])
    @transaction = @envelope.transactions.new
  end

  def create
    if Transaction.create(params[:transaction])
      flash[:alert] = 'Amount deducted'
    else
      flash[:alert] = 'error creating tranasction'
    end
    redirect_to envelopes_path
  end

  def destroy
  end 
end