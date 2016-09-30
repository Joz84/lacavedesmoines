class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :mentions ]

  def home
    @bordeaux = Deposit.find_by(sku: "bordeaux")
    @montdemarsan = Deposit.find_by(sku: "montdemarsan")
    @portets = Deposit.find_by(sku: "portets")
    @partners = Brewery.where(partner: true)
    #@breweries = Brewery.all.shuffle[0..5]
  end

  def dashboard
  end

  def mentions
  end

end
