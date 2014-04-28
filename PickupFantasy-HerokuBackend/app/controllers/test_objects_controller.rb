class TestObjectsController < ApplicationController
  before_action :set_test_object, only: [:show, :edit, :update, :destroy]

  # GET /test_objects
  # GET /test_objects.json
  def index
    @test_objects = TestObject.all
  end

  # GET /test_objects/1
  # GET /test_objects/1.json
  def show
  end

  # GET /test_objects/new
  def new
    @test_object = TestObject.new
  end

  # GET /test_objects/1/edit
  def edit
  end

  # POST /test_objects
  # POST /test_objects.json
  def create
    @test_object = TestObject.new(test_object_params)

    respond_to do |format|
      if @test_object.save
        format.html { redirect_to @test_object, notice: 'Test object was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_object }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_objects/1
  # PATCH/PUT /test_objects/1.json
  def update
    respond_to do |format|
      if @test_object.update(test_object_params)
        format.html { redirect_to @test_object, notice: 'Test object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_objects/1
  # DELETE /test_objects/1.json
  def destroy
    @test_object.destroy
    respond_to do |format|
      format.html { redirect_to test_objects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_object
      @test_object = TestObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_object_params
      params.require(:test_object).permit(:active, :away_team, :away_team_stats, :away_total_score, :created, :final, :finalbox, :game_code, :game_date_day, :game_date_epoch_time, :game_date_month, :game_date_time, :game_date_year, :game_location, :game_progress, :game_quarter_time, :game_status, :game_status_id, :game_type, :game_type_id, :global_id, :home_team, :home_team_stats, :home_total_score, :objects_id, :latest_play, :latest_plays, :line_score, :players, :possession, :resource_uri, :scoring_plays, :season, :slug, :status, :summary, :teams, :tv_station, :updated, :updated_epoch_time, :week)
    end
end
