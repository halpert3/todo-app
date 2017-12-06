json.extract! user_task, :id, :description, :due, :created_at, :updated_at
json.url user_task_url(user_task, format: :json)
