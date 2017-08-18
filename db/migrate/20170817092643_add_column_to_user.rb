class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, default: "Petya"
    add_column :users, :count, :integer, default: 0
  end
end
