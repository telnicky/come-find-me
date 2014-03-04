class CreateLocationRequests < ActiveRecord::Migration
  def change
    create_table :location_requests do |t|
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
