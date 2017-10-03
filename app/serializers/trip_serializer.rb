class TripSerializer < ActiveModel::Serializer
  attributes :id, :place_name, :departing_date, :returning_date, :travel_duration, :transportation, :accomodation, :eat, :activities
  has_one :user
end
