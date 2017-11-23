json.id @resource.id
json.title @resource.title

# may not need, just messing around :3
json.header do
  json.url @resource.url
  json.image_url @resource.image_url
end
