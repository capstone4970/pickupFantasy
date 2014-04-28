class TestActivesController < ApplicationController
  before_action :set_test_active, only: [:show, :edit, :update, :destroy]

  # GET /test_actives
  # GET /test_actives.json
  def index
    @test_actives = TestActive.all
  end

  # GET /test_actives/1
  # GET /test_actives/1.json
  def show
  end

  # GET /test_actives/new
  def new
    @test_active = TestActive.new
  end

  # GET /test_actives/1/edit
  def edit
  end

  # POST /test_actives
  # POST /test_actives.json
  def create
    @test_active = TestActive.new(test_active_params)

    respond_to do |format|
      if @test_active.save
        format.html { redirect_to @test_active, notice: 'Test active was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_active }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_active.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_actives/1
  # PATCH/PUT /test_actives/1.json
  def update
    respond_to do |format|
      if @test_active.update(test_active_params)
        format.html { redirect_to @test_active, notice: 'Test active was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_active.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_actives/1
  # DELETE /test_actives/1.json
  def destroy
    @test_active.destroy
    respond_to do |format|
      format.html { redirect_to test_actives_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_active
      @test_active = TestActive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_active_params
      params.require(:test_active).permit(:active_state, :distance, :down, :minutes, :quarter, :seconds, :segment_number, :status, :status_id, :team_possession_id, :under_review, :yards_from_goal)
    end
end
