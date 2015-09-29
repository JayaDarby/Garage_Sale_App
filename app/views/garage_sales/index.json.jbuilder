json.array!(@garage_sales) do |garage_sale|
  json.extract! garage_sale, :id, :address
  json.url garage_sale_url(garage_sale, format: :json)
end