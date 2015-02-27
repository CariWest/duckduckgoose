require 'dbcfaker'

get '/user/:username' do
  @current_user = User.where(username: params[:username]).first
  @tweets = @current_user.tweets
  @quote = @current_user.quote
  # p @current_user.tweets.first.content
  erb :'users/profile'
end

