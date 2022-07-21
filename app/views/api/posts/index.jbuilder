json.status 200
json.success true
json.total_pages @total_pages
json.data do
  json.array! @posts do |post|
    json.id post.id
    json.title post.title
    json.content post.content
    json.privacy post.privacy
    json.group_name post.group_name
  end
end
