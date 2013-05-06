get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/upload' do
  erb :upload
end

post '/upload' do
  p params
  File.open('uploads/' + params['myfile'][:filename], 'w')  do |file|
    file.write(params['myfile'][:tempfile].read)
  end
  return "The file was successfully uploaded!"
end

