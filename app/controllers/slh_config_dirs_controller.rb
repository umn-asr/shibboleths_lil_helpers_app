class SlhConfigDirsController < ApplicationController

  def tarball
    @slh_config_dir = SlhConfigDir.find(params[:id])
    send_file @slh_config_dir.tarball_path, :filename => @slh_config_dir.download_tarball_file_name
  end
  # GET /slh_config_dirs
  # GET /slh_config_dirs.json
  before_filter :load_user
  def index
    @slh_config_dirs = SlhConfigDir.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slh_config_dirs }
    end
  end

  # GET /slh_config_dirs/1
  # GET /slh_config_dirs/1.json
  def show
    @slh_config_dir = SlhConfigDir.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @slh_config_dir }
    end
  end

  # GET /slh_config_dirs/new
  # GET /slh_config_dirs/new.json
  def new
    @slh_config_dir = SlhConfigDir.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @slh_config_dir }
    end
  end

  # GET /slh_config_dirs/1/edit
  def edit
    @slh_config_dir = SlhConfigDir.find(params[:id])
  end

  # POST /slh_config_dirs
  # POST /slh_config_dirs.json
  def create
    @slh_config_dir = SlhConfigDir.new(params[:slh_config_dir])

    respond_to do |format|
      if @slh_config_dir.save
        format.html { redirect_to [@user,@slh_config_dir], :notice => 'Slh config dir was successfully created.' }
        format.json { render :json => @slh_config_dir, :status => :created, :location => @slh_config_dir }
      else
        format.html { render :action => "new" }
        format.json { render :json => @slh_config_dir.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slh_config_dirs/1
  # PUT /slh_config_dirs/1.json
  def update
    @slh_config_dir = SlhConfigDir.find(params[:id])

    respond_to do |format|
      if @slh_config_dir.update_attributes(params[:slh_config_dir])
        format.html { redirect_to [@user, @slh_config_dir], :notice => 'Slh config dir was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @slh_config_dir.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slh_config_dirs/1
  # DELETE /slh_config_dirs/1.json
  def destroy
    @slh_config_dir = SlhConfigDir.find(params[:id])
    @slh_config_dir.destroy

    respond_to do |format|
      format.html { redirect_to user_slh_config_dirs_url(@user) }
      format.json { head :ok }
    end
  end
end
