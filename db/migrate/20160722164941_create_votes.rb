class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :option_vote
      t.references :option, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
