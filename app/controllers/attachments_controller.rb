class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_attachment

  def destroy
    @attachment.destroy if current_user.author_of?(@attachment.attachable)
    redirect_back(fallback_location: root_path)
  end

  private
  
  def load_attachment
    @attachment = Attachment.find(params[:id])
  end

end