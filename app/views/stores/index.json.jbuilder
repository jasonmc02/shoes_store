json.stores do
  json.array!(@stores) do |store|
    json.extract! store, :id, :name, :address
  end
end
json.success true
json.total_elements @stores.length
