class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
    @tweets = @user.tweets
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_path }
      else
        format.html { render :action => 'edit' }
      end
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url,
                      notice: "User #{@user.nickname} was successfully created." }
       # format.json { render json: @user,
       #               status: :created, location: @user}
      else
        format.html { render action: "new" }
        #format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
  end
end
