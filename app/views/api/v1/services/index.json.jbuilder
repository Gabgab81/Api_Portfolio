json.array! @services do |service|
  # json.extract! service, :id
    json.id service.id
    json.title service.title
    # json.icon service.icon.key
end