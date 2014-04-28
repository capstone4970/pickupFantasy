class TestPlayStatsController < ApplicationController
  before_action :set_test_play_stat, only: [:show, :edit, :update, :destroy]

  # GET /test_play_stats
  # GET /test_play_stats.json
  def index
    @test_play_stats = TestPlayStat.all
  end

  # GET /test_play_stats/1
  # GET /test_play_stats/1.json
  def show
  end

  # GET /test_play_stats/new
  def new
    @test_play_stat = TestPlayStat.new
  end

  # GET /test_play_stats/1/edit
  def edit
  end

  # POST /test_play_stats
  # POST /test_play_stats.json
  def create
    @test_play_stat = TestPlayStat.new(test_play_stat_params)

    respond_to do |format|
      if @test_play_stat.save
        format.html { redirect_to @test_play_stat, notice: 'Test play stat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_play_stat }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_play_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_play_stats/1
  # PATCH/PUT /test_play_stats/1.json
  def update
    respond_to do |format|
      if @test_play_stat.update(test_play_stat_params)
        format.html { redirect_to @test_play_stat, notice: 'Test play stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_play_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_play_stats/1
  # DELETE /test_play_stats/1.json
  def destroy
    @test_play_stat.destroy
    respond_to do |format|
      format.html { redirect_to test_play_stats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_play_stat
      @test_play_stat = TestPlayStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_play_stat_params
      params.require(:test_play_stat).permit(:defense_assists, :defense_forced_fumbles, :defense_misc_assists, :defense_misc_tackles, :defense_passes_defensed, :defense_sack_yards, :defense_sacks, :defense_sp_assists, :defense_sp_tackles, :defense_stuff_yards, :defense_stuffs, :defense_tackles, :fg_attempted, :fg_blocked, :fg_distances, :fg_long, :fg_made, :fumble_fumbles, :fumble_lost_fumbles, :fumble_own_recovered, :fumble_own_recovered_td, :fumble_own_recovered_yards, :interception_return_attempts, :interception_return_long, :interception_return_long_td, :interception_return_touchdowns, :interception_return_yards, :interceptions, :kick_return_long, :kick_return_long_td, :kick_return_touchdowns, :kick_return_yards, :kick_returns, :kickoffs, :kickoffs_end_zone, :kickoffs_touchback, :opponent_fumbles_recovered, :opponent_fumbles_td, :opponent_fumbles_yards, :passing_attempts, :passing_completions, :passing_interceptions, :passing_long, :passing_long_td, :passing_net_yards, :passing_sacked, :passing_touchdowns, :passing_yards, :passing_yards_lost, :penalty_penalties, :penalty_yards, :player__first_name, :player__global_id, :player__last_name, :player__number, :player__position, :punt_return_long, :punt_return_long_td, :punt_return_touchdowns, :punt_return_yards, :punt_returns, :punting_inside_20, :punting_long, :punting_return_yards, :punting_returns, :punting_touchbacks, :punting_yards, :punts, :punts_blocked, :receiving_long, :receiving_long_td, :receiving_targets, :receiving_tds, :receiving_yards, :receptions, :return_total_touchdowns, :return_total_yards, :rushing_attempts, :rushing_long, :rushing_long_td, :rushing_touchdowns, :rushing_yards, :safeties, :two_point_conversions, :two_point_conversions_attempted, :xp_attempts, :xp_blocked, :xp_made)
    end
end
