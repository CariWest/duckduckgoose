get '/' do
  p "inside home page"
  erb :index
end

post '/user/login' do
  user = User.where(username: params[:username]).first
  if user != "nil"
    if user.authenticate(params[:password])
      session[:id] = user.id
      redirect "/user"
    else
      # flash[:notice] = "Login usuccessful. Try again." #How to implement  ActionDispath::Flash
      redirect '/'
      #instead of redirect, maybe render erb:index with the users input(put that in form value)
    end
  end
end

post '/user/register' do
  user = User.create(params[:user])
  session[:id] = user.id
  redirect "/user"
end


