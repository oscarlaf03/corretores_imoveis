Geocoder.configure(
  units: :km,
  api_key: ENV['GOOGLE_API_SERVER_KEY'],
  lookup: :google,
  use_https: true,
  language: :pt
)
