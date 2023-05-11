json.array! @technologies do |technology|
  # json.extract! technology, :id
    json.id technology.id
    json.name technology.name
    json.icon technology.icon.key
end