class Post
  # initilise setters and getters for fields id title and post body
  attr_accessor(:id,:title,:post_body)
  # create a connection to the db
  def self.open_connection
    conn = PG.connect(dbname: "blog")
  end

  def save
    conn = Post.open_connection

    if(!self.id)
      sql = "INSERT INTO post (title,post_body) VALUES ('#{self.title}','#{self.post_body}')"
      conn.exec(sql)
    else
      sql = "UPDATE post SET title='#{self.title}', post_body='#{self.post_body}' WHERE id= #{self.id}"
      conn.exec(sql)
    end

  end

  def self.all
    # create a connection
    conn = self.open_connection
    # create a query to pass for the db
    sql = "SELECT id,title,post_body FROM post ORDER BY id"
    # execute the query.
    results = conn.exec(sql)
    # loop over the results
    posts = results.map do |result|
      # hydrate it
      self.hydrate(result)
    end

    posts
  end

  def self.find(id)
    # create a new connection
    conn = self.open_connection
    # query it for one item
    sql = "Select * from post WHERE id = #{id} LIMIT 1"
    # execute the query
    posts_results = conn.exec(sql)
    # hydrate the valuse
    post = self.hydrate(posts_results[0])
  end

  def self.destroy(id)
    conn = self.open_connection
    sql = "DELETE FROM post WHERE id = #{id}"
    conn.exec(sql)
  end

  def self.hydrate(post_data)
    post = Post.new

    post.id = post_data['id']
    post.title = post_data['title']
    post.post_body = post_data['post_body']

    post
  end

end
