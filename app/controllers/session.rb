get '/' do
  erb :index
end

post '/users/login' do
  user = User.where(username: params[:username]).first
  if user.authenticate(params[:password])
    session[:id] = user.id
    redirect "/user"
  else
    # flash[:notice] = "Login usuccessful. Try again." #How to implement  ActionDispath::Flash
    redirect '/'
    #instead of redirect, maybe render erb:index with the users input(put that in form value)
  end
end


