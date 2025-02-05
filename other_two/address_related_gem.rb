gem 'geocoder'

config/initializers/geocoder.rb

Geocoder.configure(
  lookup: :nominatim,
  timeout: 5,
  units: :km
)

in controller file

  def search
    results = Geocoder.search(params[:query])
    addresses = results.map { |r| r.address }
    render json: addresses
  end

give query in params you will get array of options related query values 
ex: query: pune station
"Pune Junction, Near Jahangir Hospital, Sassoon Marg, Somwar Peth, Pune, Pune District, Maharashtra, 411001, India"
by doing some code changes you can get city pincode state contry seperately

============================================================================================================================
gem 'city-state'

in console
CS.countries 
will render all countries with country code

CS.states("IN") => will render all the states for india
CS.cities("MH") => will render all cities for maharashtra
