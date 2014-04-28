class TestTeamStatsController < ApplicationController
  before_action :set_test_team_stat, only: [:show, :edit, :update, :destroy]

  # GET /test_team_stats
  # GET /test_team_stats.json
  def index
    @test_team_stats = TestTeamStat.all
  end

  # GET /test_team_stats/1
  # GET /test_team_stats/1.json
  def show
  end

  # GET /test_team_stats/new
  def new
    @test_team_stat = TestTeamStat.new
  end

  # GET /test_team_stats/1/edit
  def edit
  end

  # POST /test_team_stats
  # POST /test_team_stats.json
  def create
    @test_team_stat = TestTeamStat.new(test_team_stat_params)

    respond_to do |format|
      if @test_team_stat.save
        format.html { redirect_to @test_team_stat, notice: 'Test team stat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_team_stat }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_team_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_team_stats/1
  # PATCH/PUT /test_team_stats/1.json
  def update
    respond_to do |format|
      if @test_team_stat.update(test_team_stat_params)
        format.html { redirect_to @test_team_stat, notice: 'Test team stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_team_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_team_stats/1
  # DELETE /test_team_stats/1.json
  def destroy
    @test_team_stat.destroy
    respond_to do |format|
      format.html { redirect_to test_team_stats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_team_stat
      @test_team_stat = TestTeamStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_team_stat_params
      params.require(:test_team_stat).permit(:active, :created, :defense_assists, :defense_forced_fumbles, :defense_misc_assists, :defense_misc_tackles, :defense_passes_defenced, :defense_sack_yards, :defense_sacks, :defense_sp_assists, :defense_sp_tackles, :defense_stuff_yards, :defense_stuffs, :defense_tackles, :fg_attempted, :fg_blocked, :fg_distances, :fg_long, :fg_made, :first_downs_passing, :first_downs_penalty, :first_downs_rushing, :first_downs_total, :fourth_down_attempts, :fourth_down_made, :fumble_fumbles, :fumble_lost_fumbles, :fumble_own_recovered, :fumble_own_recovered_td, :fumble_own_recovered_yards, :game, :goal_to_go_attemps, :goal_to_go_made, :stat_id, :interception_return_attempts, :interception_return_long, :interception_return_long_td, :interception_return_touchdowns, :interception_return_yards, :interceptions, :kick_return_long, :kick_return_long_td, :kick_return_touchdowns, :kick_return_yards, :kick_returns, :kickoffs, :kickoffs_end_zone, :kickoffs_touchback, :opponent_fumbles_recovered, :opponent_fumbles_td, :opponent_fumbles_yards, :passing_attempts, :passing_completions, :passing_interceptions, :passing_long, :passing_long_td, :passing_net_yards, :passing_sacked, :passing_touchdowns, :passing_yards, :passing_yards_lost, :penalty_penalties, :penalty_yards, :possession_minutes, :possession_seconds, :punt_return_long, :punt_return_long_td, :punt_return_touchdowns, :punt_return_yards, :punt_returns, :punting_inside_20, :punting_long, :punting_return_yards, :punting_returns, :punting_touchbacks, :punting_yards, :punts, :punts_blocked, :receiving_long, :receiving_long_td, :receiving_targets, :receiving_tds, :receiving_yards, :receptions, :red_zone_attempts, :red_zone_made, :resource_uri, :return_total_touchdowns, :return_total_yards, :rushing_attempts, :rushing_long, :rushing_long_td, :rushing_touchdowns, :rushing_yards, :safeties, :slug, :team, :third_down_attempts, :third_down_made, :total_net_yards, :total_plays, :total_touchdowns, :turnovers, :two_point_conversions, :two_point_conversions_attempted, :updated, :xp_attempts, :xp_blocked, :xp_made)
    end
end
