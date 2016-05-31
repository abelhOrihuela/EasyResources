class WelcomeController < ApplicationController
  def index

  end

  def facebook
    auth = request.env["omniauth.auth"]

    raise auth.to_yaml
    data = {
      nombre: auth.info.first_name,
      apellido: auth.info.last_name,
      username: auth.info.nickname,
      email:  auth.info.email,
      provider: auth.provider,
      uid: auth.uid
    }
  end
end
