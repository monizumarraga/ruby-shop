class UserArticlesController < ApplicationController
    def create
        article=UserArticle.find_by(user: current_user.id, article: params[:article_id])
        if article
            article.number += params[:number].to_i
            article.price=Article.price(params[:article_id], article.number)
            if article.save
                flash[:success] = "Article was successfully added to cart"
                redirect_to shop_path
            else
                flash[:success] = "There was a problem adding the article #{@user_article.article.name}"
                redirect_to shop_path
            end
        else
            price=Article.price(params[:article_id], params[:number])
            new_article=UserArticle.create(user: current_user, article: Article.find(params[:article_id]), number: params[:number], price: price)
            flash[:success] = "Article was successfully added to cart"
            redirect_to shop_path
        end
    end
    
    def update
        article=UserArticle.find(params[:id])
        article.number = params[:user_article][:number]
        puts article.article_id
        puts article.number
        article.price=Article.price(article.article_id, article.number)
        if article.save
            flash[:success] = "Article was successfully added to cart"
            redirect_to cart_path
        else
            flash[:success] = "There was a problem adding the article #{@user_article.article.name}"
            redirect_to cart_path
        end
    end
    
    def destroy
        @user_article = UserArticle.find(params[:id])
        @user_article.destroy
        flash[:notice] = "Article was successfully removed from cart"
        redirect_to cart_path
    end
    
end
