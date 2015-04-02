get '/api/customers' do
  Customer.all.to_json
end

get '/api/customers/:id' do
  customer ||= Customer.get(params[:id]) || halt(404)
  customer.to_json
end

post '/api/customers' do
  body = JSON.parse request.body.read
  customer = Customer.create(
    name:    body['name'],
    visit_time: body['visit_time'],
    created_at: body['created_at'],
  )
  status 201
  customer.to_json
end

put '/api/customers/:id' do
  body = JSON.parse request.body.read
  customer ||= Customer.get(params[:id]) || halt(404)
  halt 500 unless customer.update(
    name:    body['name'],
    visit_time: body['visit_time'],
    created_at: body['created_at'],
  )
  customer.to_json
end

delete '/api/customers/:id' do
  customer ||= Customer.get(params[:id]) || halt(404)
  halt 500 unless customer.destroy
end
