class Mobile::BaseController < ApplicationController
  layout "mobile"
  before_filter ,:get_weichat_id
  
  def get_weichat_id
    if params[:weichat_id].present?
      session[:open_id] = params[:weichat_id]
    end
  end
  
end