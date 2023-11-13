class PlaceSerializer 
  include JSONAPI::Serializer
    attributes :name, :address, :place_id
  
    # set_type :recipes the serializer gem is going to set this automatically based on the object that its serializing
  
    # set_id :id the serializer gem is going to set this automatically
  end