class Post
  include BaseModel

  property :title, String, :required => true
  property :body,  Text,   :required => true
  
  has n, :comments
end
