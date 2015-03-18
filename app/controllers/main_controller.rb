class MainController < ApplicationController
  def index
  end

  def entry
    @bg = 'entry'
    if user_signed_in?
      redirect_to root_path
    else
      @user = User.new
    end

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

  def update_where
    @trip = Trip.find(params[:id])
    respond_to do |format|
      if @trip.update(track_id: params[:trip][:track_id])
        format.html { redirect_to when_path(@trip.slug) }
      else
        format.html { render action: 'where' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # def build_track
  #   @bg = 'where'
  #   @tracks = Track.all
  #   @track = Track.first.try(:attrs)
  # end

  def when
    @bg = 'where'
    @trip = Trip.find_by(slug: params[:slug])
  end

  def update_when
    @trip = Trip.find(params[:id])
    @trip.update(appointment: params[:trip][:appointment])
    redirect_to who_path(@trip.slug)
  end
end
