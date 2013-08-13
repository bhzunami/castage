class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.integer :adults
      t.integer :children
      t.date :start_date
      t.date :end_date
      t.boolean :with_car
      t.text :note

      t.timestamps
    end
  end
end
