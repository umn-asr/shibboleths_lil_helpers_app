class SlhSitesController < ApplicationController
  # GET /slh_sites
  # GET /slh_sites.json
  before_filter :load_user
  before_filter :load_slh_config_dir
  before_filter :load_slh_strategy
  before_filter :load_slh_host
  def index
    @slh_sites = SlhSite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slh_sites }
    end
  end

  # GET /slh_sites/1
  # GET /slh_sites/1.json
  def show
    @slh_site = SlhSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slh_site }
    end
  end

  # GET /slh_sites/new
  # GET /slh_sites/new.json
  def new
    @slh_site = SlhSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @slh_site }
    end
  end

  # GET /slh_sites/1/edit
  def edit
    @slh_site = SlhSite.find(params[:id])
  end

  # POST /slh_sites
  # POST /slh_sites.json
  def create
    @slh_site = SlhSite.new(params[:slh_site])

    respond_to do |format|
      if @slh_site.save
        format.html { redirect_to @slh_site, :notice => 'Slh site was successfully created.' }
        format.json { render :json => @slh_site, :status => :created, :location => @slh_site }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slh_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slh_sites/1
  # PUT /slh_sites/1.json
  def update
    @slh_site = SlhSite.find(params[:id])

    respond_to do |format|
      if @slh_site.update_attributes(params[:slh_site])
        format.html { redirect_to @slh_site, :notice => 'Slh site was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slh_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slh_sites/1
  # DELETE /slh_sites/1.json
  def destroy
    @slh_site = SlhSite.find(params[:id])
    @slh_site.destroy

    respond_to do |format|
      format.html { redirect_to slh_sites_url }
      format.json { head :ok }
    end
  end
end
