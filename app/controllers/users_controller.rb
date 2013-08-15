class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :show, :create, :edit, :update, :destry]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
  	@users = User.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Benutzer #{@user.name} erfolgreich angelegt"
  		redirect_to current_user
  	else
  		render 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:success] = "Profil erfogreich gespeichert"
  		sign_in @user
  		redirect_to @user
  	else
  		render 'edit'
  	end
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "Benutzer erfogreich gelöscht"
  	redirect_to users_url
  end

  # Password reset
  def show_password_reset
    render 'password_reset'
  end

  def password_reset
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset 
      flash[:success] = "Ein Mail wurde an ihre Adresse gesendet."
      redirect_to root_url
    else
      flash[:error] = "Zu dieser E-Mail Adresse ist kein Benutzer registriert."
      render 'password_reset'
    end  
  end

  def edit_password_reset
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update_password_reset
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:error] = "Dieser Link ist abgelaufen, bitte lassen Sie sich einen neuen zukommen"
      render 'password_reset'
    elsif @user.update_attributes(params[:user])
      sign_in @user
      redirect_to root_url, :notice => "Das Passwort wurde geändert"
    else
      render 'edit_password_reset'
    end    
  end

  private

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
  	redirect_to(root_url) unless current_user.admin?
  end

end
