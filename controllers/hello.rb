class Hello < Junior::Controller
  
  layout 'layouts/app.haml'
  
  def index
    @hello = "Stay cool."

    render 'views/hello.haml'
  end

  def world
    @hello = "Hello World!"

    render 'views/hello.haml'
  end
  
end