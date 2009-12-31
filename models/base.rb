module BaseModel
  def self.included(model)
    model.class_eval <<-RUBY, __FILE__, __LINE__ + 1
      include DataMapper::Resource

      property :id,         Serial
      property :deleted_at, ParanoidDateTime

      timestamps :at
    RUBY
  end
end
