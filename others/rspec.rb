rspec is measurely used for writing test coverage.

factory_bot => for creation of data
in gemfile: gem 'rspec-rails'
            gem 'factory_bot_rails'
            bundle install
            rails g rspec:install

you will get spec folder 
in spec/rails_helper.rb uncomment.following lines
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

create spec/support/factory_bot.rb 
   RSpec.configure do |config| 
    config.include FactoryBot::Syntax::Methods

   end

create models and factory for first time like following way after that files will create automatically

rails g rspec:model user

for running specs run the command
  rake db:migrate RAILS_ENV=test

  now in factories create the data like
  FactoryBot.define do
    factory :user do
      name {'akshay'}
      task {'running the specs '}
      
    end
  end

  and create specs in models folder like
  require 'rails_helper'

RSpec.describe User, type: :model do   ===>>> same for the controllers also create spec/controllers/file_name_spec.rb 
                                                ==RSpec.describe User, type: :controller do
                                      or use command rails g rspec:controller users

 
  context "creating an user " do 
    let (:user) {create :user} ==>>> you can also create user like 
                                     user = FactoryBot.create(:user)
                                     or user = FactoryBot.create(:user , name: "xyz" , age: 26, ...)
                                     for creating user like let(:user) {:create :user} u have to create a spec/support/factory_bot.rb
    let (:user1) {create :user }
    it "shoulv be a valid user" do
      expect(user.id).to_not eq(nil)
    end
    it "should have unique name " do 
      expect(user1.valid?).to eq(true)
    end
  end
end

now run the specs 
rspec spec/models/user_spec.rb #rspec/folder/folder/filename
if you want to run only particular spec then mention line no ot it block
    rspec spec/models/user_spec.rb:17

    validation applying for age be like 
    validates :age , numericality: {in: 10..20}
     it " should.... " do
        user.age < 30
     end

    then create spec and check if validation is okay
must use bang operator with let for dependent destroy
    # suppose student having has_many :subjects then to check dependent: :destroy 
    let!(:student1) {create :student ,name: "samba" , age: 15}
    let!(:subject){create :subject , page: 252 , published: 563  , student: student1}
    let!(:subject2) {create :subject , page: 456 , student: student1}
      it "should delete all the subject also" do
        student1.destroy
        expect(student1.subjects.count).to eq(0)
      end

      ================================================================================
      following is another way this is more simple than previous one
      gemfile 
      gem 'factory_bot_rails'
      gem 'rspec-rails'
      gem 'pry', '~> 0.14.1'
      gem 'shoulda-matchers'
    end
    spec/factories/payslip.rb
    FactoryBot.define do
      factory :payslip do
        from_date { Date.today }
        to_date { Date.today }
        month { "august" }
      end

    end
    spec/factories/user.rb
    FactoryBot.define do
      factory :user do
        first_name { Faker::Name.first_name }
        last_name { Faker::Name.last_name }
        email { Faker::Internet.email }
        password { Faker::Alphanumeric.alpha(number: 10) }
        role { "employee" }
    # FactoryBot.define do
    #   factory :user do
    #     first_name { Faker::Name.first_name }
    #     last_name { Faker::Name.last_name }
    #     email { Faker::Internet.email }
    #     password { Faker::Alphanumeric.alpha(number: 10) }
    #     role { "employee" }
    
        factory :user_with_timeoffs do
          after(:create) do |user|
            create(:timeoff, user: user)
          end
        end
      end
    end
    #     factory :user_with_timeoffs do
    #       after(:create) do |user|
    #         create(:timeoff, user: user)
    #       end
    #     end
    #   end
    # end

    spec/models/payslip_spec.rb
    require 'rails_helper'

RSpec.describe Payslip, :type => :model do
  it { should validate_presence_of(:from_date) }
  it { should validate_presence_of(:to_date) }
  it { should validate_presence_of(:month) }
end
time_off_allocation.rb
require 'rails_helper'

RSpec.describe TimeoffAllocation, :type => :model do
  describe "Validating associations" do
    it { should belong_to(:timeoff).class_name('Timeoff') }
  end
end
spec/models/timeoff_spec.rb
RSpec.describe Timeoff, :type => :model do
  describe "Validating associations" do
    context 'timeoff_allocations associations' do
      it { expect(described_class.reflect_on_association(:timeoff_allocations).macro).to eq(:has_many) }
    end

    context 'user associations' do
      it { expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to) }
    end
    it { should have_many(:timeoff_allocations).class_name('TimeoffAllocation') }
    it { should belong_to(:user).class_name('User') }
  end
end

user.rb
RSpec.describe User, :type => :model do
  describe "Validating associations" do
    context 'timeoffs associations' do
      it { expect(described_class.reflect_on_association(:timeoffs).macro).to eq(:has_many) }
    end
    it { should have_many(:timeoffs).class_name('Timeoff') }
  end
end

add following code in rails_helper.rb

require 'shoulda/matchers'
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
  

