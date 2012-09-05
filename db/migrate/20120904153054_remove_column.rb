class RemoveColumn < ActiveRecord::Migration
  def up
  	remove_column :users, :passwod_digest
  end

  def down
  end
end
