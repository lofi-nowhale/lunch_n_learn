class UserSerializer 
  include JSONAPI::Serializer
    attributes :name, :email, :api_key
  
    # set_type :recipes the serializer gem is going to set this automatically based on the object that its serializing
  
    # set_id :id the serializer gem is going to set this automatically
  end