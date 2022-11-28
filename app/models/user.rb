class User < ApplicationRecord
    # validates :name, :email , presence: true 
    # validates :password , uniqueness: true 
    has_many :smaccounts  
    def self.shown
        " hello akkshay #{3+6}"
    end
    def sho
       name  " hi"
    end
    def another
        self.smaccounts
    end
end
