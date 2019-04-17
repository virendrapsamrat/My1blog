class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "samrat", password: "samrat", except: [:index, :show]

	def index
		@article= Article.all
	end

	def show
       @article = Article.find(params[:id])
    end
	
	def new
		@article=Article.new
	end

	def edit
        @article = Article.find(params[:id])
    end

	def create
		 @article = Article.new(params.require(:article).permit(:title, :text ,:college_name ,:contact_number ,:email_id))
         if @article.save
         redirect_to @article
     else
     	render 'new'
    end
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
