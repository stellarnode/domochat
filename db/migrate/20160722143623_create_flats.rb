class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.integer :number
      t.integer :floor
      t.integer :entrance

      t.timestamps
    end
  end
end
