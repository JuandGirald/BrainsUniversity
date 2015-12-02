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
    @comments = @video.comment_threads.order('created_at desc')
    @new_comment = Comment.build_from(@video, current_user.id, "") if current_user
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

  def doubts
    @message = Message.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def doubts_mail
    @message = Message.new(doubts_message_params)

    if @message.valid?
      DoubtsMailer.new_message(@message).deliver
    else
      flash.now.alert = "Check the error list"
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

	private

		def set_user
      @video = Video.find(params[:id])
    end

    def doubts_message_params
      params.require(:message).permit(:name, :email, :subject,
                                      :body)
    end

		def video_params
			params.require(:video).permit(:link, :subject)
		end

		def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
