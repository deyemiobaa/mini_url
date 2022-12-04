json.extract! link, :id, :long_url, :short_url, :clicks, :created_at, :updated_at
json.url link_url(link, format: :json)
