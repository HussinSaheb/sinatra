require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?

get '/users' do
   "get user"
end

get '/users/new' do
  "create a new user presumably given a form? "
end

post '/users' do
  "create new user"
end

get '/users/:id' do
  id = params[:id]
  "gets and displays a user with the id #{id}"
end

get '/users/:id/edit' do
  id = params[:id]
  "supposed to edit the user with the id: #{id}"
end

put 'users/:id' do
  "updating the user with the #{id}"
end

delete 'users/:id' do
  "deletes a user with the #{id}"
end
