class Posts < Junior::Controller
  
  layout 'layouts/app.haml'
  
  def index
    @posts = Post.all
    
    render 'views/posts/index.haml'
  end

  def create
    @post = Post.create( params[ 'post' ] )

    redirect("/posts/#{@post.id}")
  end

  def new
    render 'views/posts/new.haml'
  end

  def edit
    @post = Post.get( @resource_id )
    
    render 'views/posts/edit.haml'
  end

  def show
    @post = Post.get( @resource_id )
    
    render 'views/posts/show.haml'
  end

  def update
    @post = Post.get( @resource_id )
    @post.update( params[ 'post' ] )

    render 'views/posts/show.haml'
  end

  def delete
    @post = Post.get( @resource_id )
    
    render 'views/posts/delete.haml'
  end

  def destroy
    @post = Post.get( @resource_id )
    @post.destroy
    
    redirect('/posts')
  end

end