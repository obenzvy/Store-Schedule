class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :date_visited
      t.float :spent

      t.timestamps
    end
  end
end
