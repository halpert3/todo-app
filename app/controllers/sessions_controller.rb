class SessionsController < ApplicationController

def create
  auth = request.env['omniauth.auth']

  user= User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
                          # we made this last method in our model

  session[:user_id] = user.id
  redirect_to_root_url, notice: 'Signed In'

end

def destroy
  session[:user_id] = nil
  redirect_to_root_url, notice: 'Signed Out'
end

def new

end


end