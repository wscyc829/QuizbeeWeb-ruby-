class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  respond_to :html, :js

  include SessionsHelper

  def index
    @room = Room.new
    @rooms = current_user.rooms

    @friend = Friendship.new
    @friends = current_user.friendships + current_user.users

  end

  def logout
      log_out if logged_in?
      redirect_to login_path
  end

  
  def create_room

    @room = current_user.rooms.create!(room_name: params[:cr][:room_name])
    @rooms = current_user.rooms
  end

  def add_friend
    f = User.where(first_name: params[:af][:first_name],
                          last_name: params[:af][:last_name]).to_a.first
    @friend = current_user.friendships.create(friend_id: f.id)
    @friends = current_user.friendships + current_user.users
  end

  private

    def require_login
    	redirect_to login_path if session[:user_id].nil?
    end
end
