class PostsController < Sinatra::Base
  # sets the root as the parent directory of the current File
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly.
  set :views, Proc.new{File.join(root,'views')}

 # add this line to setup the reloader
  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
      id: 0,
      title: 'post 0',
      post_body: "this is the 0 post"
    },
    {
      id: 1,
      title: 'post 1',
      post_body: "this is the first post"
    },
    {
      id: 2,
      title: 'post 2',
      post_body: "this is the second post"
    },
    {
      id: 3,
      title: 'post 3',
      post_body: "this is the third post"
    },]

  get '/' do
    @title = "Blog Posts"
    @posts = $posts
    erb :'posts/index'
  end

  get '/new' do
    "new"
  end

  post '/' do
    "create new post"
  end

  get '/:id' do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/show'
  end

  get '/:id/edit' do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/edit'
  end

  put '/:id' do
    "updating the post with the #{id}"
  end

  delete '/:id' do
    "deletes a post with the #{id}"
  end




end
