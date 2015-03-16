json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :password_confirmation, :cuenta, :telefono, :informacion_adicional
  json.url user_url(user, format: :json)
end
