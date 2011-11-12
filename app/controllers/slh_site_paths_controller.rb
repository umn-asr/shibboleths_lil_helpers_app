class SlhSitePathsController < ApplicationController
  # GET /slh_site_paths
  # GET /slh_site_paths.json

  before_filter :load_user
  before_filter :load_slh_config_dir
  before_filter :load_slh_strategy
  before_filter :load_slh_host
  before_filter :load_slh_site

  def index
    @slh_site_paths = SlhSitePath.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slh_site_paths }
    end
  end

  # GET /slh_site_paths/1
  # GET /slh_site_paths/1.json
  def show
    @slh_site_path = SlhSitePath.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slh_site_path }
    end
  end

  # GET /slh_site_paths/new
  # GET /slh_site_paths/new.json
  def new
    @slh_site_path = SlhSitePath.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @slh_site_path }
    end
  end

  # GET /slh_site_paths/1/edit
  def edit
    @slh_site_path = SlhSitePath.find(params[:id])
  end

  # POST /slh_site_paths
  # POST /slh_site_paths.json
  def create
    @slh_site_path = SlhSitePath.new(params[:slh_site_path])

    respond_to do |format|
      if @slh_site_path.save
        format.html { redirect_to @slh_site_path, :notice => 'Slh site path was successfully created.' }
        format.json { render :json => @slh_site_path, :status => :created, :location => @slh_site_path }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slh_site_path.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slh_site_paths/1
  # PUT /slh_site_paths/1.json
  def update
    @slh_site_path = SlhSitePath.find(params[:id])

    respond_to do |format|
      if @slh_site_path.update_attributes(params[:slh_site_path])
        format.html { redirect_to @slh_site_path, :notice => 'Slh site path was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slh_site_path.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slh_site_paths/1
  # DELETE /slh_site_paths/1.json
  def destroy
    @slh_site_path = SlhSitePath.find(params[:id])
    @slh_site_path.destroy

    respond_to do |format|
      format.html { redirect_to slh_site_paths_url }
      format.json { head :ok }
    end
  end
end
