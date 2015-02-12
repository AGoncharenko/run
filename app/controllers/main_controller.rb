class MainController < ApplicationController
  def index
  end

  def create_run
    @trip = Trip.create
    redirect_to where_path(@trip.slug)
  end

  def where
    @bg = 'where'
    @tracks = Track.all
    @track = Track.first.try(:attrs)
  end
end
