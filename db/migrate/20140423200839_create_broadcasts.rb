class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.integer :user_id
      t.integer :sender_id
      t.integer :message_id

      t.timestamps
    end
  end
end
