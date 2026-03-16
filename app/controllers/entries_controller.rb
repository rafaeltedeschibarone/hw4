class EntriesController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

  private

  def require_login
    redirect_to login_path unless current_user
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :image)
  end

end
