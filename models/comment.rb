class Comment
  include BaseModel

  property :body,  Text,   :required => true
  
  belongs_to :post
  belongs_to :user
end
