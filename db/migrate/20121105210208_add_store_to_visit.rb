class AddStoreToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :store_id, :integer
  end
end
