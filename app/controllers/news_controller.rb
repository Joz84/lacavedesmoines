class NewsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @news = New.all
  end

  def show
    @new = New.find(params[:id])
  end
end
