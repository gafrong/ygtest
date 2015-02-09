class RetailersController < ApplicationController

  def index
    @retailers = Retailer.all
    @products = Product.all
  end

  def show
    @retailer = Retailer.find(params[:id])
    @products = Product.where(retailer_id: params[:id]).page params[:page]
  end

end