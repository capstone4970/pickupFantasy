class WeekplayerdataController < ApplicationController
  before_action :set_weekplayerdatum, only: [:show, :edit, :update, :destroy]

  # GET /weekplayerdata
  # GET /weekplayerdata.json
  def index
    @weekplayerdata = Weekplayerdatum.all
  end

  # GET /weekplayerdata/1
  # GET /weekplayerdata/1.json
  def show
  end

  # GET /weekplayerdata/new
  def new
    @weekplayerdatum = Weekplayerdatum.new
  end

  # GET /weekplayerdata/1/edit
  def edit
  end

  # POST /weekplayerdata
  # POST /weekplayerdata.json
  def create
    @weekplayerdatum = Weekplayerdatum.new(weekplayerdatum_params)

    respond_to do |format|
      if @weekplayerdatum.save
        format.html { redirect_to @weekplayerdatum, notice: 'Weekplayerdatum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weekplayerdatum }
      else
        format.html { render action: 'new' }
        format.json { render json: @weekplayerdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekplayerdata/1
  # PATCH/PUT /weekplayerdata/1.json
  def update
    respond_to do |format|
      if @weekplayerdatum.update(weekplayerdatum_params)
        format.html { redirect_to @weekplayerdatum, notice: 'Weekplayerdatum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @weekplayerdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekplayerdata/1
  # DELETE /weekplayerdata/1.json
  def destroy
    @weekplayerdatum.destroy
    respond_to do |format|
      format.html { redirect_to weekplayerdata_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekplayerdatum
      @weekplayerdatum = Weekplayerdatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weekplayerdatum_params
      params.require(:weekplayerdatum).permit(:NFLPlayerID, :SlotID, :CurrentAuctionValue, :FantasyPoints, :Passyds, :Rushyds, :Rcvyds, :Fumbles, :TDPass, :TwoPointPass, :TwoPointRush, :TDRush, :TDRcv, :TwoPointRcv, :ExtraPoint, :FieldGoal)
    end
end
