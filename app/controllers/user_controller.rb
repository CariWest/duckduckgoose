require 'dbcfaker'

get '/user/:username' do
  @current_user = User.where(username: params[:username]).first
  @tweets = @current_user.tweets
  @quote = @current_user.quote
  # p @current_user.tweets.first.content
  erb :'users/profile'
end

post '/follow' do
  current_user.id
  user_to_be_followed_id = params[:followership_id]

  Followership.create(user_id: user_to_be_followed_id, follower_id: current_user.id)
  redirect "/user/#{User.find(user_to_be_followed_id).username}"
end
