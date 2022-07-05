class AddPrivacyToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :privacy, :integer, default: 0
  end
end
