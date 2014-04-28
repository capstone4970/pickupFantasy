class GamesOfWeeksController < ApplicationController
  before_action :set_games_of_week, only: [:show, :edit, :update, :destroy]

  # GET /games_of_weeks
  # GET /games_of_weeks.json
  def index
    @games_of_weeks = GamesOfWeek.all
  end

  # GET /games_of_weeks/1
  # GET /games_of_weeks/1.json
  def show
  end

  # GET /games_of_weeks/new
  def new
    @games_of_week = GamesOfWeek.new
  end

  # GET /games_of_weeks/1/edit
  def edit
  end

  # POST /games_of_weeks
  # POST /games_of_weeks.json
  def create
    @games_of_week = GamesOfWeek.new(games_of_week_params)

    respond_to do |format|
      if @games_of_week.save
        format.html { redirect_to @games_of_week, notice: 'Games of week was successfully created.' }
        format.json { render action: 'show', status: :created, location: @games_of_week }
      else
        format.html { render action: 'new' }
        format.json { render json: @games_of_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games_of_weeks/1
  # PATCH/PUT /games_of_weeks/1.json
  def update
    respond_to do |format|
      if @games_of_week.update(games_of_week_params)
        format.html { redirect_to @games_of_week, notice: 'Games of week was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @games_of_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games_of_weeks/1
  # DELETE /games_of_weeks/1.json
  def destroy
    @games_of_week.destroy
    respond_to do |format|
      format.html { redirect_to games_of_weeks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_games_of_week
      @games_of_week = GamesOfWeek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def games_of_week_params
      params.require(:games_of_week).permit(:gameKey, :gameID, :time, :date, :homeTeam, :awayTeam)
    end
end
