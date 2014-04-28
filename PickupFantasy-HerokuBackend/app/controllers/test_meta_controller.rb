class TestMetaController < ApplicationController
  before_action :set_test_metum, only: [:show, :edit, :update, :destroy]

  # GET /test_meta
  # GET /test_meta.json
  def index
    @test_meta = TestMetum.all
  end

  # GET /test_meta/1
  # GET /test_meta/1.json
  def show
  end

  # GET /test_meta/new
  def new
    @test_metum = TestMetum.new
  end

  # GET /test_meta/1/edit
  def edit
  end

  # POST /test_meta
  # POST /test_meta.json
  def create
    @test_metum = TestMetum.new(test_metum_params)

    respond_to do |format|
      if @test_metum.save
        format.html { redirect_to @test_metum, notice: 'Test metum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_metum }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_meta/1
  # PATCH/PUT /test_meta/1.json
  def update
    respond_to do |format|
      if @test_metum.update(test_metum_params)
        format.html { redirect_to @test_metum, notice: 'Test metum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_meta/1
  # DELETE /test_meta/1.json
  def destroy
    @test_metum.destroy
    respond_to do |format|
      format.html { redirect_to test_meta_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_metum
      @test_metum = TestMetum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_metum_params
      params.require(:test_metum).permit(:limit, :next, :offset, :previous, :total_count)
    end
end
