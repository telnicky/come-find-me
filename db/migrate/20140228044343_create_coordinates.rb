class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.integer :longitude
      t.integer :latitude
      t.integer :to_user
      t.integer :from_user

      t.timestamps
    end
  end
end
