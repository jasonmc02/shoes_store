json.store do
  json.extract! @store, :id, :name, :address
end
json.success true
