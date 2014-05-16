class VideosController < ApplicationController

	before_action :set_user, only: [:show, :edit, :update, :destroy]


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

	private

		def set_user
      @video = Video.find(params[:id])
    end

		def video_params
			params.require(:video).permit(:link, :subject)
		end

end