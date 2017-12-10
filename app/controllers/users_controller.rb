class UsersController < ApplicationController
  
  def new
  
      @user = User.new
  
  end
  
  def index
  @users = User.all
  
  end
  
  
  def create
  
      @user= User.new(params_user)
      if @user.save
        flash[:success]="Welcome to Alpha blog #{@user.username}"
        redirect_to articles_path
      else
        render'new'
        
      end
  
  end
  
  def edit
      
      @user = User.find(params[:id])
      
  end
  
  def update
      @user = User.find(params[:id]) 
      if @user.update(params_user)
        redirect_to articles_path
        flash[:success]= "Your account has been updated"
        
      else
        render 'edit'
      end
  
  end
  
  def show
      @user=User.find(params[:id])
    
    
  end
    
  
  private 
  
        def params_user
        
            params.require(:user).permit(:username,:email,:password)
        
        end

end
  

