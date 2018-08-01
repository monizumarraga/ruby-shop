class UsersController < ApplicationController
  
  def show
    @user=User.find(params[:id])
    @articles=@user.articles
  end
  
  def cart
    @user = current_user
    @user_articles = UserArticle.where(user: current_user)
    @total=@user_articles.reduce(0){|sum,e| sum +=  e.price }
  end
  
  def shop
    @user = current_user
    @articles = Article.all
  end
end