module ControllerResponder

  def destroy_and_respond(object, url, notice)
    object.destroy
    respond_to do |format|
      format.html {redirect_to url, notice: notice}
      format.json { render json: @resource }
    end
  end
  
end
