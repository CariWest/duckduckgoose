require 'dbcfaker'

get '/user/edit' do
  # @user = User.find(session[:id])
  erb :'users/edit_profile'
end

get '/user/:username' do
  @current_user = User.where(username: params[:username]).first
  @tweets = @current_user.tweets
  @quote = @current_user.quote
  erb :'users/profile'
end

post '/find_user' do
  user = User.where(username: params[:user][:username]).first

  redirect "/user/#{user.username}"
end


post '/update_image' do
  user = User.where(id: session[:id]).first
  user.update_attributes(image: params[:user][:url])

  redirect "/user"
end
