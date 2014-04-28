class GamesofweeksController < ApplicationController
  before_action :set_gamesofweek, only: [:show, :edit, :update, :destroy]

  # GET /gamesofweeks
  # GET /gamesofweeks.json
  def index
    @gamesofweeks = Gamesofweek.all
  end

  # GET /gamesofweeks/1
  # GET /gamesofweeks/1.json
  def show
  end

  # GET /gamesofweeks/new
  def new
    @gamesofweek = Gamesofweek.new
  end

  # GET /gamesofweeks/1/edit
  def edit
  end

  # POST /gamesofweeks
  # POST /gamesofweeks.json
  def create
    @gamesofweek = Gamesofweek.new(gamesofweek_params)

    respond_to do |format|
      if @gamesofweek.save
        format.html { redirect_to @gamesofweek, notice: 'Gamesofweek was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gamesofweek }
      else
        format.html { render action: 'new' }
        format.json { render json: @gamesofweek.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gamesofweeks/1
  # PATCH/PUT /gamesofweeks/1.json
  def update
    respond_to do |format|
      if @gamesofweek.update(gamesofweek_params)
        format.html { redirect_to @gamesofweek, notice: 'Gamesofweek was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gamesofweek.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gamesofweeks/1
  # DELETE /gamesofweeks/1.json
  def destroy
    @gamesofweek.destroy
    respond_to do |format|
      format.html { redirect_to gamesofweeks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gamesofweek
      @gamesofweek = Gamesofweek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gamesofweek_params
      params.require(:gamesofweek).permit(:gameKey, :gameID, :time, :date, :homeTeam, :awayTeam)
    end
end
