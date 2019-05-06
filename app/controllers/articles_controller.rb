class ArticlesController < ApplicationController

	def index
    @articles = Article.search(params[:search])
	end

  def new
    @article = Article.new
  end

	def show
    @reply = Reply.new
    @article = Article.find(params[:id])
    @comments= @article.comments.search(params[:search])
   # byebug
    # @reply1= Reply.search(params[:search])
  end

	def edit
        @article = Article.find(params[:id])
    end

	def create
		@article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to @article
  end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

 def destroy
  @article = Article.find(params[:id])
  @article.destroy
  
 redirect_to articles_path
 end

    private
     def article_params
         params.require(:article).permit(:title, :text ,:college_name ,:contact_number ,:email_id)
     end

end
