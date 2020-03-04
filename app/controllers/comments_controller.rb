class CommentsController < ApplicationController
  before_action :set_topic
  before_action :set_comments, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @topic.comments
  end

  def new
    @comment = topic.comments.new
  end

  def create
    @comment = @topic.comments.new(comments_params)
    if comment.save
      redirect_to_ subs_topic_path(@topic.sub, @topic)
    else 
      render.new 
  
  end

  def edit
  end

  def update
    if @comment.update(comments_params)
      redirect_to_ subs_topic_path(@topic.sub, @topic)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to_ subs_topic_path(@topic.sub, @topic)
  end

  private

    def comments_params
      params.require(:comment).permit(:body) #CHECK IN SCHEMA
    
    
    end

    def set_comment
      @comment = comment.find(params[:id]) #finds the individual comment
    end


    def set_topic
      @topic = topic.find(params[:id])
    end
    
    


end
