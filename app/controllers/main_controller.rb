class MainController < ApplicationController
  def index
  end

  def create_run
    @trip = Trip.create
    redirect_to where_path(@trip.slug)
  end

  def where
    @bg = 'where'
    @trip = Trip.find_by(slug: params[:slug])
    @tracks = Track.all
    @track = Track.first.try(:attrs)
  end

  # def build_track
  #   @bg = 'where'
  #   @tracks = Track.all
  #   @track = Track.first.try(:attrs)
  # end

  def when
    @bg = 'where'
    @trip = Trip.find_by(slug: params[:slug])
    @trip.update(track_id: params[:track_id])
  end
end
