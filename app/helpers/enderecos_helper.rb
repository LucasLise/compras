module EnderecosHelper
  def ultimos_enderecos
    current_user.enderecos.take(3)
  end
end
