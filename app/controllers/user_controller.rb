require 'dbcfaker'

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

