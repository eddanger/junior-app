class User
  include BaseModel

  property :name, String, :required => true
  
  has n, :comments
end
