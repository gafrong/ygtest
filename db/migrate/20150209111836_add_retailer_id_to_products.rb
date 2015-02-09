class AddRetailerIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :retailer_id, :integer
  end
end
