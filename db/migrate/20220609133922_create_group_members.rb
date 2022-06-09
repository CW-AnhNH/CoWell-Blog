class CreateGroupMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_members do |t|
      t.string :group_id
      t.string :integer
      t.string :user_id
      t.string :integer
      t.integer :status

      t.timestamps
    end
  end
end
