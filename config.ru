require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pry'
require_relative './controllers/posts_controller.rb'

# direct the reuquest to the correct controller
run PostsController
