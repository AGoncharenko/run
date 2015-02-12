class Track < ActiveRecord::Base
  has_many :trips
  belongs_to :user
  store_accessor :data, :origin, :destination, :waypoints, :name
  
  def attrs
    return {
        name: self.name,
        origin: {lat: eval(self.origin)[:lat], lng: eval(self.origin)[:lng]},
        destination: {lat: eval(self.destination)[:lat], lng: eval(self.destination)[:lng]},
        waypoints: self.waypoints.present? ? eval(self.waypoints).map {|wp| {lat: wp[:lat], lng: wp[:lng]}} : []
    }
  end
end
