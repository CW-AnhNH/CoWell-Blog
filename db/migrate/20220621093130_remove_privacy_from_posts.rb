class RemovePrivacyFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :privacy, :integer
  end
end
