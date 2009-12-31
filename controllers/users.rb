class Users < Junior::Controller
  
  layout 'layouts/app.haml'
  
  def index
    @users = User.all
    
    render 'views/users/index.haml'
  end

  def create
    @user = User.create( params[ 'user' ] )

    redirect("/users/#{@user.id}")
  end

  def new
    render 'views/users/new.haml'
  end

  def edit
    @user = User.get( @resource_id )
    
    render 'views/users/edit.haml'
  end

  def show
    @user = User.get( @resource_id )
    
    render 'views/users/show.haml'
  end

  def update
    @user = User.get( @resource_id )
    @user.update( params[ 'user' ] )

    render 'views/users/show.haml'
  end

  def delete
    @user = User.get( @resource_id )
    
    render 'views/users/delete.haml'
  end

  def destroy
    @user = User.get( @resource_id )
    @user.destroy
    
    redirect('/users')
  end

end