class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @bordeaux = Deposit.find_by(sku: "bordeaux")
    @montdemarsan = Deposit.find_by(sku: "montdemarsan")
    @portets = Deposit.find_by(sku: "portets")
    @breweries = Brewery.all.shuffle[0..5]
  end

  def dashboard
  end
end
