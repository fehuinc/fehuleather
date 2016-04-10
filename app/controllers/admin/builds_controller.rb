class Admin::BuildsController < ApplicationController
  def ajax_update
    build = Build.find params[:id]
    build[params[:prop]] = params[:val]
    success = build.save
    render json: params
  end
end
