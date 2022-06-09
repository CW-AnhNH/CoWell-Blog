class CreatePostVotings < ActiveRecord::Migration[7.0]
  def change
    create_table :post_votings do |t|
      t.integer :user_id
      t.integer :post_id
      t.boolean :vote_status

      t.timestamps
    end
  end
end
