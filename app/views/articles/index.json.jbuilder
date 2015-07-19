json.articles do
  json.array!(@articles) do |article|
    json.extract! article, :id, :name, :description, :price, :total_in_shelf, :total_in_vault
    json.store_name article.store.name
  end
end
json.success true
json.total_elements @articles.length