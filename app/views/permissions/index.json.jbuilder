json.array!(@permissions) do |permission|
  json.extract! permission, :id, :user_id, :permissible_user_id, :condition_id, :goal_id
  json.url permission_url(permission, format: :json)
end
