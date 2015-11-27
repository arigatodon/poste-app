json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :image, :phone
  json.url post_url(post, format: :json)
end
