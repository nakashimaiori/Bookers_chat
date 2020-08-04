class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, except: [:top, :about]
  before_action :baria_user, only: [:edit, :update]

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
     end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "successfully updated user!"
    else
      render "edit"
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  # email追加してみた

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  # urlを直接入力しても行けない
  def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
   end
end
