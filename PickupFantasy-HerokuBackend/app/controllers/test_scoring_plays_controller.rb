class TestScoringPlaysController < ApplicationController
  before_action :set_test_scoring_play, only: [:show, :edit, :update, :destroy]

  # GET /test_scoring_plays
  # GET /test_scoring_plays.json
  def index
    @test_scoring_plays = TestScoringPlay.all
  end

  # GET /test_scoring_plays/1
  # GET /test_scoring_plays/1.json
  def show
  end

  # GET /test_scoring_plays/new
  def new
    @test_scoring_play = TestScoringPlay.new
  end

  # GET /test_scoring_plays/1/edit
  def edit
  end

  # POST /test_scoring_plays
  # POST /test_scoring_plays.json
  def create
    @test_scoring_play = TestScoringPlay.new(test_scoring_play_params)

    respond_to do |format|
      if @test_scoring_play.save
        format.html { redirect_to @test_scoring_play, notice: 'Test scoring play was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_scoring_play }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_scoring_play.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_scoring_plays/1
  # PATCH/PUT /test_scoring_plays/1.json
  def update
    respond_to do |format|
      if @test_scoring_play.update(test_scoring_play_params)
        format.html { redirect_to @test_scoring_play, notice: 'Test scoring play was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_scoring_play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_scoring_plays/1
  # DELETE /test_scoring_plays/1.json
  def destroy
    @test_scoring_play.destroy
    respond_to do |format|
      format.html { redirect_to test_scoring_plays_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_scoring_play
      @test_scoring_play = TestScoringPlay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_scoring_play_params
      params.require(:test_scoring_play).permit(:_game_cache, :_state, :active, :assist1, :assist1_global_id, :assist1_id, :assist2, :assist2_global_id, :assist2_id, :away_score_after, :away_score_before, :continuation, :created, :details, :direction, :distance, :down, :drive_id, :end_possession, :end_yardline, :game_id, :game_time, :game_time_minute, :game_time_second, :home_score_after, :home_score_before, :scoring_play_id, :pass_defensed1, :pass_defensed1_id, :pat_type, :pat_value, :play_type, :play_type_id, :player1_global_id, :player1_id, :player2_global_id, :player2_id, :player3_global_id, :player3_id, :possession, :quarter, :review_team, :review_team_global_id, :review_team_id, :score_description, :score_type, :scoring_play, :slug, :stats_id, :tackle1, :tackle1_global_id, :tackle1_id, :tackle2, :tackle2_global_id, :tackle2_id, :target, :target_id, :time, :true_away_score_after, :true_details, :true_home_score_after, :updated, :yardline, :yards)
    end
end
