json.article do
  json.extract! @article, :id, :name, :description, :price, :total_in_shelf, :total_in_vault
  json.store_name @article.store.name
end
json.success true
