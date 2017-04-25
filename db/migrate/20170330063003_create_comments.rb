class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id,index: true,null: false,unique: false,foreign_key: true
      t.integer :group_id,index: true,null: false ,unique:false,foreign_key: true
      t.text :comment,index:false,null:true,unique:false,foreign_key:false
      t.text :image,index:false,null:true,unique:false,foreign_key:false
      t.timestamps
    end
  end
end