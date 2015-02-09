json.array!(@requests) do |request|
  json.extract! request, :id, :course_id, :schedule_id, :state_id
  json.url request_url(request, format: :json)
end
