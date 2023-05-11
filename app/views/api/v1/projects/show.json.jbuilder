json.extract! @project, :id, :name, :description
json.techProjects @project.techProjects do |techProject|
  # json.extract! techProject, :id, :technology_id, :project_id
  json.technology do
    json.id techProject.technology.id
    json.name techProject.technology.name
    json.icon techProject.technology.icon.key
    json.test "Hello"
  end
end
