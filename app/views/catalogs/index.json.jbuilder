json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :title, :description
  json.url catalog_url(catalog, format: :json)
end
