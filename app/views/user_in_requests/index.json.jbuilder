json.array!(@user_in_requests) do |user_in_request|
  json.extract! user_in_request, :id, :user_id, :request_id
  json.url user_in_request_url(user_in_request, format: :json)
end
