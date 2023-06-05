# json.array! @projects do |project|
#   json.extract! project, :id, :name, :description, :code, :figma, :address, :image[key], :db[key]
# end
json.array! @projects do |project|
  json.id project.id
  json.name project.name
  json.description project.description
  json.code project.code
  json.figma project.figma
  json.address project.address
  json.image project.image.key
  json.db project.db.key
  json.techProjects project.techProjects do |techProject|
    json.id techProject.technology.id
    json.name techProject.technology.name
    json.icon techProject.technology.icon.key
  end
end