gemfile ===>>> gem 'city-state'


bundle install ====>>>>>


rails g scaffold address country state city
  address.rb be like====>>>>

class Address < ApplicationRecord
    validates :country, presence: true
    
    validates :state, inclusion: { in: ->(record) { record.state_opts.keys }, allow_blank: true }
    validates :state, presence: { if: ->(record) { record.state_opts.present? } }
    validates :city, inclusion: { in: ->(record) { record.city_opts }, allow_blank: true }
    validates :city, presence: { if: ->(record) { record.city_opts.present? } }
  
    def country_opts
      CS.countries.with_indifferent_access
    end
  
    def state_opts
      CS.states(country).with_indifferent_access
    end
  
    def city_opts
      CS.cities(state, country) || []
    end
  
    def country_name
      country_opts[country]
    end
  
    def state_name
      state_opts[state]
    end
  end