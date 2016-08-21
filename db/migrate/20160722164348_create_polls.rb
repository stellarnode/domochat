class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :title
      t.text :body
      t.datetime :start
      t.datetime :finish
      t.integer :status
      t.integer :poll_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
