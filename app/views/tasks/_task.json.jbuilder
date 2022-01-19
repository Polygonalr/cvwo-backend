json.extract! task, :id, :title, :description, :status, :owner_id, :created_at, :updated_at
json.url task_url(task, format: :json)
