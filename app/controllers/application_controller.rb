class ApplicationController < ActionController::Base
  protect_from_forgery

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_slh_config_dir
    @slh_config_dir = SlhConfigDir.find(params[:slh_config_dir_id])
  end

  def load_slh_strategy
    @slh_strategy = SlhStrategy.find(params[:slh_strategy_id])
  end

  def load_slh_host
    @slh_host = SlhHost.find(params[:slh_host_id])
  end

  def load_slh_site
    @slh_site = SlhSite.find(params[:slh_site_id])
  end
end
