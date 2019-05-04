class RepliesController < ApplicationController
	

	def create
	   @comment = Comment.find(params[:comment_id])
	   @reply = @comment.replies.new(reply_params)
	   @reply.user_id = current_user.id
	   @reply.save
	   #redirect_to "/articles/#{params[:article_id]}"
	end


	 def destroy
	 	 @comment = Comment.find(params[:comment_id])
         @reply = Reply.find(params[:id])
         @reply.destroy
        # redirect_to "/articles/#{params[:article_id]}"

	 end
    



   private
    def reply_params
      params.require(:reply).permit(:body)
    end

  
end
