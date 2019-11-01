class ArtistsController < ApplicationController
  def index
    if Preference.last
      sort_order = Preference.last.artist_sort_order  
    end

    if sort_order
      if sort_order == "ASC"
        @artists = Artist.order(id: :asc)
      elsif sort_order == "DESC"
        @artists = Artist.order(id: :desc)
      else
        flash[:alert] = "Invalid sort method!"
        @artists = Artist.all 
      end
    else
      @artists = Artist.all
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    if Preference.last.allow_create_artists
      @artist = Artist.new
    else
      redirect_to artists_path, alert:"You are not allowed to create artists."
    end
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.update(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    flash[:notice] = "Artist deleted."
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
