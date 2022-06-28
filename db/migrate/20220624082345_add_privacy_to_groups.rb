class AddPrivacyToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :privacy, :integer, default: 0
  end
end
