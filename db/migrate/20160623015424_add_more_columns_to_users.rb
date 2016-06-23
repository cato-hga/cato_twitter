class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_profile, :string
    add_column :users, :followers_count, :integer
  end
end
