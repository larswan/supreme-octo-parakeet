class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :update, :destroy]

  # GET /episodes
  def index
    @episodes = Episode.all

    render json: @episodes.to_json(only: [:id, :date, :number])
  end

  # GET /episodes/1
  def show
    render json: @episode
  end

  # POST /episodes
  # def create
  #   @episode = Episode.new(episode_params)

  #   if @episode.save
  #     render json: @episode, status: :created, location: @episode
  #   else
  #     render json: @episode.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /episodes/1
  # def update
  #   if @episode.update(episode_params)
  #     render json: @episode
  #   else
  #     render json: @episode.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /episodes/1
  def destroy
    if @episode
      @episode.destroy
    else
      render json: @episode.errors.full_messages
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def episode_params
      params.require(:episode).permit(:date, :number)
    end
end
