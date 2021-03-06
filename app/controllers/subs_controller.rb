class SubsController < ApplicationController #child of the application controller
  # M - Model, all the logic on the table or records, associated, valids, methods
  # V - View, user sees and interacts with
  # C - Controller, / Routes traffic directors
  # Skinny Controller / Fat models
    # - controller should be just actions, 
    # - Models logic 
  
# Actions - What you can do in the app
  # actions return res , html, xml, json. 
  # if it doesn't return a response a response then it redirects to an action that does 


  # READ - GET

  # Index - show all the records, in the table
      # def index
        # @model_name(s) = Model_name.all
      # end

  # show - show a single record that needs an ID, id which record we want to see
      # def show
        # @model_name = Model_name.find(params[:id])


  # edit - updating Form, id, id which record we want to update         
      # def edit
      #   @model_name = Model_name.find(params[:id])
      # end

  # new - create form, creates a record in memory 
      # def new 
        # @model_name = Model_name.find(params[:id])
      # end


  #cerate - post correlates to new ^^^
  # create - create new record within datebase, from the new action 

    # def create
    # @model_name = Model_name.new(model_name_params)

    # if @model_name.dave
    #   do something, or redirect somewhere
    #   else
    #     render.new
    #   end
    # end


    .
    .
    .
#     private #passing in certain attr.
#       def model_name_params
#         params.require(:model_name).permit(:attr, :attr2, :every col the model has, not including id, created, update )
      
#       end

#   #update - PUT
#   # update - updating a single record with the edit form, id, id is whatever record you would like to update

#   # def update
#   #   @model_name = Model_name.find(params[:id])
#   #   if @model_name.update(model_name_params)
#   #     do something 
#   #   else
#   #     render :edit
#   #   end
#   # end

#   #destroy - DELETE
#   # destory - delete a record from a database, id. 

#   # def destory # has to be called destory
#   # @model_name = Model_name.find(params[:id])
#   # @model_name.destroy

#   # #or

#   # Model_name.find(params[:id]).destroy 

#   # go somewhere
#   # end
# before_ action :set_sub only: [:show, :edit, :update, :destory]


#   def index
#     @subs = Sub.all
#     #render index.html.erb
#   end


#   def show
#     #render show.html.erb
#   end

#   def new
#     @sub = Sub.new
#     render partial: 'form'
  
#   end

#   def create
#     @sub = Sub.new(sub_params)
#     if @sub.save
#       redirect_to subs_path
#     else
#       # render :
#       render partial: "form"
#     end
#   end

#   def edit
#       render show.html.erb

#   end

#   def update
#     @sub = Sub.find(sub_params)
#     if @sub.update(sub_params)
#       redirect_to subs_path
#     else
#       # render :edit
#       render partial "form"
#     end
#   end

#   def destroy
#     @sub.destroy
#     redirect_to subs_path
#   end


# private
#   def sub_params
#     params.require(:sub).permit(:name)
#   end

#   def set_sub
#     @sub = Sub.find(params[:id])
#   end
# end
class SubsController < ApplicationController
  # M Model, all the logic on the table, or records, assoic. valids, methods
  # V View, users sees and interacts with
  # C Controller, / Routes traffic directors
  # Skinny Controllers / Fat Models
      # - Controllers should be just actions 
      # - Models logic
  # Actions - what you can do in the app 
      # actions return res , html, xml, json 
      # if it doesn't return a res then it redirect to an action that does
      # READ -  GET 
      #   Index - show all the records, in the table
            # def index
            #   @model_name(s) = Model_name.all 
            # end
      #   show - show a single records, id, id which record we want to see
          # def show 
          #   @model_name = Model_name.find(params[:id])
          # end
      #   edit - updating Form, id, id which record we want to update   
          # def edit 
          #   @model_name = Model_name.find(params[:id])
          # end
      #   new  - create form , creates a record in memory
        # def new 
        #   @model_name = Model_name.new
        # end
      # Create - POST 
        # create - create a new record in db, from the new action 
        # def create
        #   @model_name = Model_name.new(model_name_params)
        #   if @model_name.save
        #     do something, or redirect somewhere 
        #   else
        #     render :new
        #   end
        # end
        # .
        # .
        # .
        # private
        #   # passing in certain attr. 
        #   def model_name_params
        #     params.require(:model_name).permit(:attr, :attr2, :every col the modal has, not including, id, create, update )
        #   end
      # Update - PUT 
        # update - updating a single record with the edit form, id 
        # def update
        #   @model_name = Model_name.find(params[:id])
        #   if @model_name.update(model_name_params)
        #     do something
        #   else
        #     render :edit
        #   end
        # end
      # Destroy - DELETE 
        # destroy - delete a record from the db, id 
        # def destroy
        #   @model_name = Model_name.find(params[:id])
        #   @model_name.destroy
        #   # or 
        #   Model_name.find(params[:id]).destroy
        #   go somewhere 
        # end
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  # after_action
  def index
    @subs = Sub.all 
    # render index.html.erb
  end
  def show
    # render show.html.erb
  end
  def new
    @sub = Sub.new
    # render new.html.erb
    # render partial: 'form'
  end
  def create 
    @sub = Sub.new(sub_params)
    if @sub.save 
      redirect_to subs_path
    else
      render :new
      # render partial: "form"
    end
  end
  def edit
    # render edit.html.erb
    # render partial: "form"
  end
  def update 
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit 
      # render partial: "form"
    end
  end
    def destroy
    @sub.destroy
    redirect_to subs_path
  end
  private 
    def sub_params
      params.require(:sub).permit(:name)
    end
    def set_sub
      @sub = Sub.find(params[:id])
    end
end