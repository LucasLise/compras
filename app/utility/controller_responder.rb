module ControllerResponder
  def save_and_respond(object, notice)
    respond_to do |format|
      if object.save
        format.html { redirect_to object, notice: notice }
        format.json { render :show, status: :created, location: object }
      else
        format.html { render :new }
        format.json { render json: object.errors, status: :unprocessable_entity }
      end
    end
  end

  def index_and_respond(list)
    list.paginate(page: params[:page], per_page: 9)
  end

  def destroy_and_respond(object, url, notice)
    object.destroy
    respond_to do |format|
      format.html { redirect_to url, notice: notice }
      format.json { render json: @resource }
    end
  end
end
