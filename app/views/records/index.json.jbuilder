json.array!(@records) do |record|
  json.extract! record, :id, :work_id, :comment
  json.url record_url(record, format: :json)
end
