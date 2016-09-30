class BreweriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :lists_table, only: [:index, :show]
  def index
    @breweries = Brewery.all
  end

  def show
    @brewery = Brewery.find(params[:id])
    @products = Product.where(brewery: @brewery)
  end

  private

  def lists_table
    @list_prices = Product.all.map {|p| p.price_cents * 1.0 / 100}.uniq.sort
    @list_colors = Color.all.map { |c| c.name }.sort
    @list_kinds = Kind.all.map { |k| k.name }.sort
    @list_breweries = Brewery.all.map { |b| b.name }.sort
  end

end
