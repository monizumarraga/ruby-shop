json.extract! article, :id, :code, :name, :units, :price, :discount_id, :created_at, :updated_at
json.url article_url(article, format: :json)
