class EnvelopesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @envelopes = current_user.envelopes
  end

  def edit
    @envelope = current_user.envelopes.find(params[:id])
    if @envelope.blank?
      flash[:error] = "Envelope not found"
    end
  end

  def update
  end

  def create
    user = current_user
    user.envelopes.build(params[:envelope])
    if user.save
      redirect_to envelopes_path
    else
      flash[:error] = user.errors
      render 'new'
    end

  end

  def new
    @envelope = Envelope.new
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

  def refresh
    @envelope = current_user.envelopes.find(params[:id])
    @envelope.refresh_balance
    redirect_to envelopes_path
  end

  def refresh_all
    @envelopes = current_user.envelopes
    @envelopes.each do |envelope|
      envelope.refresh_balance
    end
    Rails.logger.info "in here"
    redirect_to envelopes_path
  end
end