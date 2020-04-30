Inatra.routes do
  get '/hello' do
    [200, {}, ['Hello World']]
  end
  
  get '/hey' do
    [200, {}, ['hey!']]
  end
  
  post '/goodbye' do
    [200, {}, ['goodbye!']]
  end

end
