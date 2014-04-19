class RenameLocationRequestsToMessages < ActiveRecord::Migration
  def change
    rename_table :location_requests, :messages
  end
end
