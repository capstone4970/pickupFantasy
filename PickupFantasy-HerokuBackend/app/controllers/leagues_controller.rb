class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy]

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/test
  # GET /leagues/test.json
  def show
    #@user = User.find_by(username: params[:username])
    Rails.logger.info params

    conditions = {}
    conditions[:name] = params[:name]

    Rails.logger.info conditions

    @league = League.find(:all, :conditions => conditions)
    #@user = User.find(params[:username])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @league}
    end
  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)

    respond_to do |format|
      if @league.save
        format.js {}
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render action: 'show', status: :created, location: @league }
      else
        format.html { render action: 'new' }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    Rails.logger.info params
    
    # @league = League.find(params[:name])
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to leagues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      if params[:id] != nil
         @league = League.find(params[:id])
       else
         conditions = {}
         conditions[:name] = params[:name]
         @league = League.find(:all, :conditions => conditions) 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_params
      params.require(:league).permit(:leagueID, :name, :password, :numPlayers, :member1, :member2, :member3, :member4, :member5, :member6, :gamesOfWeekIdentifier)
    end
end
