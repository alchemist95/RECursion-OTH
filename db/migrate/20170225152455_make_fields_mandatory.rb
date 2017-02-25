class MakeFieldsMandatory < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :email, :string, null: false
  	change_column :users, :name, :string, null: false
  	change_column :users, :role, :integer, null: false
  end
end
