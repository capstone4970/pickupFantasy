class TestStatusesController < ApplicationController
  before_action :set_test_status, only: [:show, :edit, :update, :destroy]

  # GET /test_statuses
  # GET /test_statuses.json
  def index
    @test_statuses = TestStatus.all
  end

  # GET /test_statuses/1
  # GET /test_statuses/1.json
  def show
  end

  # GET /test_statuses/new
  def new
    @test_status = TestStatus.new
  end

  # GET /test_statuses/1/edit
  def edit
  end

  # POST /test_statuses
  # POST /test_statuses.json
  def create
    @test_status = TestStatus.new(test_status_params)

    respond_to do |format|
      if @test_status.save
        format.html { redirect_to @test_status, notice: 'Test status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_status }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_statuses/1
  # PATCH/PUT /test_statuses/1.json
  def update
    respond_to do |format|
      if @test_status.update(test_status_params)
        format.html { redirect_to @test_status, notice: 'Test status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_statuses/1
  # DELETE /test_statuses/1.json
  def destroy
    @test_status.destroy
    respond_to do |format|
      format.html { redirect_to test_statuses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_status
      @test_status = TestStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_status_params
      params.require(:test_status).permit(:active_state, :distance, :down, :minutes, :quarter, :seconds, :segment_number, :status, :status_id, :team_possession_id, :under_review, :yards_from_goal)
    end
end
