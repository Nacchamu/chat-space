class RemoveImageFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :image, :text
  end
end
