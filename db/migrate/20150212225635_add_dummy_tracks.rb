class AddDummyTracks < ActiveRecord::Migration
  def change
    Track.reset_column_information
    [{origin: {lat: 48.341111, lng: 29.863505}, destination: {lat: 50.437473, lng: 30.474326}, name: 'Гайворон'},
     {origin: {lat: 47.849503, lng: 35.143528}, destination: {lat: 50.450009, lng: 30.540256},
      waypoints: [{lat: 48.457831, lng: 35.044651}], name: 'Запорожье'}].each do |track|
      Track.create(track)
    end
  end
end
