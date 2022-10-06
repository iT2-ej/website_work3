class UsersController < ApplicationController
  before_action :authenticate_user!, expect: [:top]
  before_action :correct_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: '新規登録が完了しました'
    else
      render :new
    end
  end


  def index
   @users = User.all
   @user = current_user

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    if @book.update(user_params)
      redirect_to book_path(@book.id),notice: 'You have updated book successfully.'
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

end
