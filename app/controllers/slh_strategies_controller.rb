class SlhStrategiesController < ApplicationController
  # GET /slh_strategies
  # GET /slh_strategies.json
  before_filter :load_user
  before_filter :load_slh_config_dir

  def index
    @slh_strategies = SlhStrategy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slh_strategies }
    end
  end

  # GET /slh_strategies/1
  # GET /slh_strategies/1.json
  def show
    @slh_strategy = SlhStrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slh_strategy }
    end
  end

  # GET /slh_strategies/new
  # GET /slh_strategies/new.json
  def new
    @slh_strategy = SlhStrategy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @slh_strategy }
    end
  end

  # GET /slh_strategies/1/edit
  def edit
    @slh_strategy = SlhStrategy.find(params[:id])
  end

  # POST /slh_strategies
  # POST /slh_strategies.json
  def create
    @slh_strategy = SlhStrategy.new(params[:slh_strategy])

    respond_to do |format|
      if @slh_strategy.save
        format.html { redirect_to [@user, @slh_config_dir, @slh_strategy], :notice => 'Slh strategy was successfully created.' }
        format.json { render :json => @slh_strategy, :status => :created, :location => @slh_strategy }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slh_strategy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slh_strategies/1
  # PUT /slh_strategies/1.json
  def update
    @slh_strategy = SlhStrategy.find(params[:id])

    respond_to do |format|
      if @slh_strategy.update_attributes(params[:slh_strategy])
        format.html { redirect_to @slh_strategy, :notice => 'Slh strategy was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slh_strategy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slh_strategies/1
  # DELETE /slh_strategies/1.json
  def destroy
    @slh_strategy = SlhStrategy.find(params[:id])
    @slh_strategy.destroy

    respond_to do |format|
      format.html { redirect_to slh_strategies_url }
      format.json { head :ok }
    end
  end
end
