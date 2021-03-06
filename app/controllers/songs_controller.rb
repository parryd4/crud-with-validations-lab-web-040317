class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # song = Song.new(song_params)
    # if song.valid?
    #   @song.update(song_params)
    #   redirect_to song_path(@song)
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    set_song.destroy
    redirect_to "songs/index"
    #dsaflkj;adsfkljasdfklj;
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end

  def set_song
    @song = Song.find(params[:id])
  end

end
