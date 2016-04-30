class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :time
      t.integer :partysize

      t.timestamps null: false
    end
  end
end
