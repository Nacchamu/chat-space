class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users,:name,:string,:index => true,:null => false,:unique =>false

  end
end