class TestSeasonsController < ApplicationController
  before_action :set_test_season, only: [:show, :edit, :update, :destroy]

  # GET /test_seasons
  # GET /test_seasons.json
  def index
    @test_seasons = TestSeason.all
  end

  # GET /test_seasons/1
  # GET /test_seasons/1.json
  def show
  end

  # GET /test_seasons/new
  def new
    @test_season = TestSeason.new
  end

  # GET /test_seasons/1/edit
  def edit
  end

  # POST /test_seasons
  # POST /test_seasons.json
  def create
    @test_season = TestSeason.new(test_season_params)

    respond_to do |format|
      if @test_season.save
        format.html { redirect_to @test_season, notice: 'Test season was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_season }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_seasons/1
  # PATCH/PUT /test_seasons/1.json
  def update
    respond_to do |format|
      if @test_season.update(test_season_params)
        format.html { redirect_to @test_season, notice: 'Test season was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_seasons/1
  # DELETE /test_seasons/1.json
  def destroy
    @test_season.destroy
    respond_to do |format|
      format.html { redirect_to test_seasons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_season
      @test_season = TestSeason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_season_params
      params.require(:test_season).permit(:active, :created, :end_date, :season_id, :name, :resource_uri, :slug, :start_date, :updated, :year)
    end
end
