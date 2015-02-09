class Retailer < ActiveRecord::Base
  has_many :products

  paginates_per 20
end
