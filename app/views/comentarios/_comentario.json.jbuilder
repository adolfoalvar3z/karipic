json.extract! comentario, :id, :comentario, :user_id, :post_id, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
