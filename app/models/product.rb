class Product < ActiveRecord::Base
  belongs_to :retailer

  paginates_per 20
end
