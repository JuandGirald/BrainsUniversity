class StaticPagesController < ApplicationController
  def home
  	@message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      ContactMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Su mensaje fue enviado satisfactoriamente.")
    else
      flash.now.alert = "Por favor revise los errores listados"
      render :home
    end
  end

  def help
  end
  private

  	def message_params
      params.require(:message).permit(:name, :email, :subject,
                                   :body)
    end

  
end
