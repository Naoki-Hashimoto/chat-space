class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :text, null: false
  end
end
