class TestCallsController < ApplicationController
  before_action :set_test_call, only: [:show, :edit, :update, :destroy]

  # GET /test_calls
  # GET /test_calls.json
  def index
    @test_calls = TestCall.all
  end

  # GET /test_calls/1
  # GET /test_calls/1.json
  def show
  end

  # GET /test_calls/new
  def new
    @test_call = TestCall.new
  end

  # GET /test_calls/1/edit
  def edit
  end

  # POST /test_calls
  # POST /test_calls.json
  def create
    @test_call = TestCall.new(test_call_params)

    respond_to do |format|
      if @test_call.save
        format.html { redirect_to @test_call, notice: 'Test call was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_call }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_calls/1
  # PATCH/PUT /test_calls/1.json
  def update
    respond_to do |format|
      if @test_call.update(test_call_params)
        format.html { redirect_to @test_call, notice: 'Test call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_calls/1
  # DELETE /test_calls/1.json
  def destroy
    @test_call.destroy
    respond_to do |format|
      format.html { redirect_to test_calls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_call
      @test_call = TestCall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_call_params
      params.require(:test_call).permit(:meta, :objects)
    end
end
