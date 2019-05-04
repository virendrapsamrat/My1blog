class LikesController < ApplicationController
	before_action :find_comment
    before_action :find_like, only: [:destroy]
    
    def hilike
        if already_liked?
             flash[:notice] = "You can't like more than once"
        else
    	         ggggg = @comment.likes.create(user_id: current_user.id)
        end
    	   #redirect_to article_path(@article1)
    
    end
    
    def byelike
          if !(already_liked?)
             flash[:notice] = "Cannot unlike"
          else
            hhhh = @comment.likes.where(user_id: current_user).destroy_all
          end
        #redirect_to article_path(@article1)
        render 'byelike.js.erb'
    end

   def already_liked?
       Like.where(user_id: current_user.id, comment_id:
       params[:comment_id]).exists?
    end

   def find_like
        @like = @comment.likes.find(params[:id])
    end



    private
     def find_comment
     	@comment= Comment.find(params[:comment_id])
        @article1 = Article.find(params[:article_id])
     end

end
