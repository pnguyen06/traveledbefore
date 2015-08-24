class AddUserIdToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :user_id, :integer
    add_index :checks, :user_id
  end
end
