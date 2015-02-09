class AddReatilernameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :retailername, :string
  end
end
