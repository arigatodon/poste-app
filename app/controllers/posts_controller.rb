class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]



  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def search 
   
    lat = params[:latitude]
    lng = params[:longitude]
    range = params[:range] 
    @posts =  Post.near([lat, lng], range)
    respond_to do |format|
      format.js
    end

  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.reverse
    @post =Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
    @categories = Category.all
  end

  # GET /posts/1/edit
  def edit
  end
  
  def getaddress
    
  end

  

  def upvote 
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end  

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to :back
  end

  def favorite
    @post = Post.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @post
      redirect_to :back, notice: "guardado #{@post.title}"

    elsif type == "unfavorite"
      current_user.favorites.delete(@post)
      redirect_to :back, notice: "borrado #{@post.title}"

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end




  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :image, :phone, :address ,:longitude, :latitude,:category_id)
    end
end
