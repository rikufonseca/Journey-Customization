class CreateJourneys < ActiveRecord::Migration[6.1]
  def change
    create_table :journeys do |t|
      t.text :address
      t.integer :duration
      t.integer :price
      t.boolean :exterior
      t.string :interest
      t.string :sense
      t.integer :popularity
      t.text :anecdote
      t.string :environment

      t.timestamps
    end
  end
end
