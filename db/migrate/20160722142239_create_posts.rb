class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.boolean :is_pinned
      t.boolean :is_draft
      t.integer :comments_count

      t.timestamps
    end
  end
end
