class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
