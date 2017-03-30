module ModelNameHelper
  def singular_model_name_for(model)
    model.model_name.human
  end

  def plural_model_name_for(model)
    model.model_name.human(count: 2)
  end
end
