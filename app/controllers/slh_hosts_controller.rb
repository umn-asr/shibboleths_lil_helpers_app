class SlhHostsController < ApplicationController
  # GET /slh_hosts
  # GET /slh_hosts.json
  before_filter :load_user
  before_filter :load_slh_config_dir
  before_filter :load_slh_strategy


  def index
    @slh_hosts = SlhHost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slh_hosts }
    end
  end

  # GET /slh_hosts/1
  # GET /slh_hosts/1.json
  def show
    @slh_host = SlhHost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slh_host }
    end
  end

  # GET /slh_hosts/new
  # GET /slh_hosts/new.json
  def new
    @slh_host = SlhHost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @slh_host }
    end
  end

  # GET /slh_hosts/1/edit
  def edit
    @slh_host = SlhHost.find(params[:id])
  end

  # POST /slh_hosts
  # POST /slh_hosts.json
  def create
    @slh_host = SlhHost.new(params[:slh_host])

    respond_to do |format|
      if @slh_host.save
        format.html { redirect_to @slh_host, :notice => 'Slh host was successfully created.' }
        format.json { render :json => @slh_host, :status => :created, :location => @slh_host }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slh_host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slh_hosts/1
  # PUT /slh_hosts/1.json
  def update
    @slh_host = SlhHost.find(params[:id])

    respond_to do |format|
      if @slh_host.update_attributes(params[:slh_host])
        format.html { redirect_to @slh_host, :notice => 'Slh host was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slh_host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slh_hosts/1
  # DELETE /slh_hosts/1.json
  def destroy
    @slh_host = SlhHost.find(params[:id])
    @slh_host.destroy

    respond_to do |format|
      format.html { redirect_to slh_hosts_url }
      format.json { head :ok }
    end
  end
end
