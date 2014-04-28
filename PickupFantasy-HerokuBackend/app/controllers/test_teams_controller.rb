class TestTeamsController < ApplicationController
  before_action :set_test_team, only: [:show, :edit, :update, :destroy]

  # GET /test_teams
  # GET /test_teams.json
  def index
    @test_teams = TestTeam.all
  end

  # GET /test_teams/1
  # GET /test_teams/1.json
  def show
  end

  # GET /test_teams/new
  def new
    @test_team = TestTeam.new
  end

  # GET /test_teams/1/edit
  def edit
  end

  # POST /test_teams
  # POST /test_teams.json
  def create
    @test_team = TestTeam.new(test_team_params)

    respond_to do |format|
      if @test_team.save
        format.html { redirect_to @test_team, notice: 'Test team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_team }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_teams/1
  # PATCH/PUT /test_teams/1.json
  def update
    respond_to do |format|
      if @test_team.update(test_team_params)
        format.html { redirect_to @test_team, notice: 'Test team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_teams/1
  # DELETE /test_teams/1.json
  def destroy
    @test_team.destroy
    respond_to do |format|
      format.html { redirect_to test_teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_team
      @test_team = TestTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_team_params
      params.require(:test_team).permit(:active, :alias, :city, :conference, :conference_id, :created, :division, :division_id, :global_id, :team_id, :local_team, :logo_120x120, :logo_30x30, :logo_40x40, :logo_60x60, :name, :primary_color, :record, :resource_uri, :secondary_color, :slug, :stats_id, :total_defensive_rank, :total_offensive_rank, :total_passing_defense_rank, :total_passing_offense_rank, :total_rushing_defense_rank, :total_rushing_offense_rank, :updated)
    end
end
