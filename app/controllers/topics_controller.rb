class TopicsController < ApplicationController
  before_action: :set_sub
  before_action :set_topic, only: [:show, :edit, :update, :destroy]


  def index
    @topics = @sub.topics
  end

  def show
  end

  def new
    @topic = @sub.topics.new #child is plural regardless action 
  end

  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save #show page of topic
      redirect_to[@sub, @topic]
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @topic.update(topic_params)
    
    else
      render :edit
    end
  end

  def destory
    @topic.destroy 
    redirect_to sub_topics_path

  private
  #topic params - make sure that it pulls the same type {topic: {title: 'kash', body: 'asdf' }}
  def topic_params
  params.require(:topic).permit(:title, :body)
  
  end


  def set_topic
    @topic = Topic.find(params[:id]) #childs id
end

  def set_sub
    @sub = Sub.find(params[:sub_id]) #parent id
