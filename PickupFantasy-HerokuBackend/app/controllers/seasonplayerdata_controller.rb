class SeasonplayerdataController < ApplicationController
  before_action :set_seasonplayerdatum, only: [:show, :edit, :update, :destroy]

  # GET /seasonplayerdata
  # GET /seasonplayerdata.json
  def index
    @seasonplayerdata = Seasonplayerdatum.all
  end

  # GET /seasonplayerdata/1
  # GET /seasonplayerdata/1.json
  def show
  end

  # GET /seasonplayerdata/new
  def new
    @seasonplayerdatum = Seasonplayerdatum.new
  end

  # GET /seasonplayerdata/1/edit
  def edit
  end

  # POST /seasonplayerdata
  # POST /seasonplayerdata.json
  def create
    @seasonplayerdatum = Seasonplayerdatum.new(seasonplayerdatum_params)

    respond_to do |format|
      if @seasonplayerdatum.save
        format.html { redirect_to @seasonplayerdatum, notice: 'Seasonplayerdatum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @seasonplayerdatum }
      else
        format.html { render action: 'new' }
        format.json { render json: @seasonplayerdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasonplayerdata/1
  # PATCH/PUT /seasonplayerdata/1.json
  def update
    respond_to do |format|
      if @seasonplayerdatum.update(seasonplayerdatum_params)
        format.html { redirect_to @seasonplayerdatum, notice: 'Seasonplayerdatum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @seasonplayerdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasonplayerdata/1
  # DELETE /seasonplayerdata/1.json
  def destroy
    @seasonplayerdatum.destroy
    respond_to do |format|
      format.html { redirect_to seasonplayerdata_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seasonplayerdatum
      @seasonplayerdatum = Seasonplayerdatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seasonplayerdatum_params
      params.require(:seasonplayerdatum).permit(:NFLPlayerID, :cbsID, :nerdID, :CurrentTeam, :FantasyPosition, :Number, :FirstName, :LastName, :InitialAuctionValue, :CurrentAuctionValue, :projFantasyPoints, :projFantasyPointsMark, :LastPlayedPoints)
    end
end
