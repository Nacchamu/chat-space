class UpdateColumnToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :group_users,:group_id, :integer, index: true
    change_column :group_users,:user_id, :integer, index: false
  end
end
