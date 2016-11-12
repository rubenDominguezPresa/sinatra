require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/user.rb'


enable(:sessions)

# extra: que user sea un modelo en lib folder
@@users = [{username: "wolas", password: "B5%khjsd"}]

get '/' do
  erb(:index)
end

post "/log_in" do
  username=params[:username]
  password=params[:password]
  @@users.include?(username)? ((password==@@users[username])? (sessions[:logged_in]=true) : @message="login error") : @message="login error" 
  # comprobar que username y password machean a un usuario
end


post '/register' do
  # añadir un usuario
  username=params[:username]
  password=params[:password]
  user=User.new
  @message=""
  if (@@user.any? { |username| @message=@message+"  This user allready exist" }
    
  elsif user.setUsername(username)
    @message=@message+"  Invalid username"
  elsif user.serPassword password
    @message=@message+"  Invalid password"
  else
    @@users << user
    @message = "Registro completado. ahora mete datos, venga. "
  end
  redirect("/")
end

get '/profile' do
  # solo puedes llegar si estas registrado
  if session[:logged_in]
    erb(:profile)
  else
    @message = "Eres un trampas"
    redirect('/')
  end
end