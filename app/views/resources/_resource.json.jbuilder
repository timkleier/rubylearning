json.extract! resource, :id, :title, :description, :url, :root_url, :host, :image_url, :created_at, :updated_at
json.url resource_url(resource, format: :json)
