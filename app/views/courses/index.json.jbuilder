json.array!(@courses) do |course|
  json.extract! course, :id, :name, :requirements, :recommended_requirements
  json.url course_url(course, format: :json)
end
