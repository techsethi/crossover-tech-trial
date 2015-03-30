get '/api/customers' do
  customer.all.to_jsaon
end

get '/api/customers/:id' do
  customer ||= customer.get(params[:id]) || halt(404)
  customer,.to_jsaon
end

post '/api/customers' do
  body = JSON.parse request.body.read
  customer = customer.create(
    title:    body['title'],
    director: body['director'],
    synopsis: body['synopsis'],
    year:     body['year']
  )
  status 201
  customer.to_jsaon
end

put '/api/customers/:id' do
  body = JSON.parse request.body.read
  customer ||= customer.get(params[:id]) || halt(404)
  halt 500 unless customer.update(
    title:    body['title'],
    director: body['director'],
    synopsis: body['synopsis'],
    year:     body['year']
  )
  customer.to_jsaon
end

delete '/api/customers/:id' do
  customer ||= customer.get(params[:id]) || halt(404)
  halt 500 unless customer.destroy
end
