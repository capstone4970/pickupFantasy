class TestLineScoresController < ApplicationController
  before_action :set_test_line_score, only: [:show, :edit, :update, :destroy]

  # GET /test_line_scores
  # GET /test_line_scores.json
  def index
    @test_line_scores = TestLineScore.all
  end

  # GET /test_line_scores/1
  # GET /test_line_scores/1.json
  def show
  end

  # GET /test_line_scores/new
  def new
    @test_line_score = TestLineScore.new
  end

  # GET /test_line_scores/1/edit
  def edit
  end

  # POST /test_line_scores
  # POST /test_line_scores.json
  def create
    @test_line_score = TestLineScore.new(test_line_score_params)

    respond_to do |format|
      if @test_line_score.save
        format.html { redirect_to @test_line_score, notice: 'Test line score was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_line_score }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_line_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_line_scores/1
  # PATCH/PUT /test_line_scores/1.json
  def update
    respond_to do |format|
      if @test_line_score.update(test_line_score_params)
        format.html { redirect_to @test_line_score, notice: 'Test line score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_line_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_line_scores/1
  # DELETE /test_line_scores/1.json
  def destroy
    @test_line_score.destroy
    respond_to do |format|
      format.html { redirect_to test_line_scores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_line_score
      @test_line_score = TestLineScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_line_score_params
      params.require(:test_line_score).permit(:extra, :quarter, :running_score, :score)
    end
end
