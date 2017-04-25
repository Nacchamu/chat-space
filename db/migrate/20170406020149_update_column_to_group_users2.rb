class UpdateColumnToGroupUsers2 < ActiveRecord::Migration[5.0]
  def change
    change_column :group_users,:user_id, :integer, index: true
  end
end
