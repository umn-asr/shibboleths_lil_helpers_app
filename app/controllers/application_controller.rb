class ApplicationController < ActionController::Base
  protect_from_forgery

  include UmnShibAuth::ControllerMethods
  before_filter :shib_umn_auth_required
  def current_user
    @current_user ||= User.find_or_create_by_internet_id(shib_umn_session.internet_id)
  end
  helper_method :current_user
  def load_user
    @user = User.find_by_internet_id(params[:user_id])
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
