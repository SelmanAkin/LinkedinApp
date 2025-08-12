class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :title, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :text
  end
end
