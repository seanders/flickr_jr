get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect "/"
end

get '/signup' do
  erb :signup
end

get '/profile' do
  erb :profile
end

get '/newalbum' do
  erb :newalbum
end

post '/newalbum' do
  current_user.albums << Album.create(name: params[:album][:name], description: params[:album][:description])
  erb :profile
end


post '/signup' do
  @user = User.create(params[:user])
  if @user.valid?
    @user.id = session[:id]
    erb :profile
  else
    @errors = @user.errors.full_messages.join(", ")
    erb :signup
  end
end

post '/login' do
  @user = User.authenticate(params[:user][:name], params[:user][:password])
  if @user
    session[:id] = @user.id
    erb :profile
    # @last_page = session[:referrer]
    # redirect "#{@last_page}"
  else
    @errors = "Wrong username or password."
    erb :login
  end
end


get '/upload' do
  @albums = current_user.albums
  erb :upload
end

post '/upload' do
  album_destination = current_user.albums.find(params['album'])
  puts album_destination.photos
  @photo = album_destination.photos.build
  @photo.image = params['myfile']
  @photo.save!

  if @photo.save
    redirect "/albums/#{album_destination.id}"
  else
    session[:errors] = "failed to save photo"
    redirect "/upload"
  end
end

get '/albums/:album_id' do
  @album = Album.find(params[:album_id])
  @photos = @album.photos
  erb :albums
end
