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
    }]

  get '/' do
    @title = "Blog Posts"
    @posts = $posts
    erb :'posts/index'
  end

  get '/new' do
    @title = "New Post"
    @post = {
      id: '',
      title: '',
      post_body: ''
    }

    erb :'posts/new'
  end

  post '/' do
    new_post = {
      id: $posts.length(),
      title: params[:title],
      post_body: params[:post_body]
    }
    $posts.push(new_post)
    redirect "/"
  end


  get '/:id' do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/show'
  end

  get '/:id/edit' do
    @title= "Edit Post"
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/edit'
  end

  put '/:id' do
    id = params[:id].to_i
    post = $posts[id]
    post[:title] = params[:title]
    post[:post_body] = params[:post_body]
    $posts[id] = post
    redirect "/"
  end

  delete '/:id' do
    id = params[:id].to_i
    $posts.delete_at(id)
    redirect "/"
  end




end
