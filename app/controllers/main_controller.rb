class MainController < ApplicationController
  def index
  end

  def entry
    @bg = 'entry'
    if user_signed_in?
      redirect_to root_path
    else
      @user = User.new
      resource = @user
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

  def who
    @trip = Trip.find_by(slug: params[:slug])
    # logger.info "session: #{session[:credentials]['token']}\n"
    # @graph = Koala::Facebook::API.new(session[:credentials]['token'])
    # logger.info "@friends: #{@graph.inspect}\n\n\n"
    # @friends = @graph.get_connections("me", "friends")
    # logger.info "@friends: #{@friends.inspect}\n\n\n"
  end

  def import_contacts
    @contacts = request.env['omnicontacts.contacts']
    logger.info "@contacts: #{@contacts}\n\n\n"
    respond_to do |format|
      format.html
    end
  end

  def import_contacts_callback

  end
end
