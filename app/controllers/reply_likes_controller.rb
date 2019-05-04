class ReplyLikesController < ApplicationController
	before_action :find_reply
	before_action :find_like, only: [:destroy]

	def like
		@comment  = Comment.find(params[:comment_id])
		@article = Article.find(params[:article_id])
		@reply_like = @reply.reply_likes.create(user_id: current_user.id)
		#redirect_to article_path(params[:article_id])
	end


	def dislike
		@comment  = Comment.find(params[:comment_id])
		@article = Article.find(params[:article_id])
		@reply_like = @reply.reply_likes.where(user_id: current_user).destroy_all
		  #		redirect_to article_path(params[:article_id])

	end


	 def find_like
        @reply_like = @reply.reply_likes.find(params[:id])
    end

   
    private
     def find_reply
     	@reply= Reply.find(params[:reply_id])
     end

end
