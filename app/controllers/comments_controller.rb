class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.reverse
  end

 
  def create
    @post = Post.find(params[:post_id])
    # @comments = @post.comments
    @comment = @post.comments.build(comment_params)
    #@comments.save
   
    respond_to do |f|
      if @comment.save
        f.html{ redirect_to @post, notice: "El comentario fue creado "}
        f.js
      else
        f.html{ redirect_to @post, alert: "el comentario no ha podido ser creado"}  
        f.js
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
