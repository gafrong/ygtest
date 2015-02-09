class PagesController < ApplicationController

  def index
    @products = Product.all.page(params[:page])
    @retailers = Retailer.all 
  end

  def show
    @retailers = Retailer.all
    # @products = Product.where(name: params[:name])
  end

end