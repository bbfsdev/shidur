class HomeController < ApplicationController
  def index
    logger.debug "ищу app/views/home/#{current_user.role.name.downcase}.haml"
    h = File.exist?("app/views/home/#{current_user.role.name.downcase}.haml") ? current_user.role.name.downcase : 'index'
    render h
  end
end
