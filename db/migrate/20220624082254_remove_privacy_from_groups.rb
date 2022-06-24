class RemovePrivacyFromGroups < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :privacy, :integer
  end
end
