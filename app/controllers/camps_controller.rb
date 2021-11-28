class CampsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]  

  def index
    @camps = Camp.all
 end 

 def new
    @camp = Camp.new
 end

 def create
    camp = Camp.new(camp_params)
    camp.user_id = current_user.id
    if camp.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
 end

 def show
    @camp = Camp.find(params[:id])
 end

 def edit
    @camp = Camp.find(params[:id])
 end

 def update
    camp = Camp.find(params[:id])
    if camp.update(camp_params)
      redirect_to :action => "show", :id => camp.id
    else
      redirect_to :action => "new"
    end
 end

 def destroy
    camp = Camp.find(params[:id])
    camp.destroy
    redirect_to action: :index
 end

 private
 def camp_params
    params.require(:camp).permit(:title, :body, :location)
 end

end 
