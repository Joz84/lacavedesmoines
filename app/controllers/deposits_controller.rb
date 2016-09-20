class DepositsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @deposit = Deposit.find(params[:id])
  end
end
