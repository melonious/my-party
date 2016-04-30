json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :time, :partysize
  json.url reservation_url(reservation, format: :json)
end
