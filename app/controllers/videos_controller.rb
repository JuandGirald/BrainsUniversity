class VideosController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]
	# before_action :admin_user,     only: [:create, :new]


	def new
	  @video = Video.new
	end

	def index
  	if params[:subject].present?
  		@videos = Video.calculo(params[:subject]) 
  	else
  		@videos = Video.order('created_at DESC')
  	end
	end

	def show
		
	end
	 
	def create
	  @video = Video.new(video_params)
	  if @video.save
	    flash[:success] = 'Video added!'
	    redirect_to videos_path
	  else
	    render 'new'
	  end
	end

	def destroy
    Video.destroy(:id)
    flash[:success] = "User deleted."
    redirect_to root_path
  end

	private

		def set_user
      @video = Video.find(params[:id])
    end

		def video_params
			params.require(:video).permit(:link, :subject)
		end

		def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end