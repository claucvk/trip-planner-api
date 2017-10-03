class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :place_name
      t.date :departing_date
      t.date :returning_date
      t.string :travel_duration
      t.string :transportation
      t.string :accomodation
      t.string :eat
      t.string :activities

      t.timestamps
    end
  end
end
