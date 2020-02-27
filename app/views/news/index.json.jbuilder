json.array!(@news) do |news|
  json.extract! news, :title, :source, :content
  json.url news_url(news, format: :json)
end
