gem "active_model_serializers"
to generate serializer for a particular resource
rails generate serializer Post

you will get appserializer/post_serializer.rb
attributes :title, :body ( add attributes to render it on the index actions)
if you have any relation with other models specify it in the serializer file
    like has_many :comments
    
connexial 
model ActivityLog 
  has_many :tasks
  accept_nested_attributes for :tasks , :allow_destroy=> true

  activity_og_serilizer.rb
  attributes :id , :email , .... 
  has_many :tasks , serializer: TaskSerializer


  Taskserializer.rb
  attributes :id , :name , :status , :project

     def project 
        return nil if object.project.nil?
        object.project.name
     end
    end

Controller ===>>>> ActivityLogController < ApplicationController
def index 
    render json: {
        data: ActiveModelSerializers::SerializableResource.new(@activity_logs , each_serializer: ActivityLogSerializer),
        message: ["datat fetched successfully"],
        status: 200 , 
        type: "success"
    }
end

def other_all_methods
    render json: {
        data: ActiveModelSerializers::SerializableResource.new(@activity_logs , serializer: ActivityLogSerializer),
        message: ["datat fetched successfully"],
        status: 200 , 
        type: "success"
    }
end

private
def activity_log_params
    params.require(:activity_log).permit(:email , :name , :xyz , tasks_attributes: [:id , :abc , :def , :pqr])
end

Builder 
AccountController
render json: AccountSerializer.new(@account).serializable_hash , status: :ok

show ==>>
render json: CouponCodeSerializer.new(@coupon).serializable_hash , status: :ok

for create==>>
    if save
        render json: CouponCodeSerializer.new(@coupon).serializable_hash , status: :ok
    else
        render json: ErrorSerializer.new(@coupon).serializable_hash , status: :unprocessable_entity

#using association and except attributes

class SalaryInfoSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :ctc
    belongs_to :addition
    belongs_to :deduction
    belongs_to :other

    def addition
        object.addition.as_json(except: [:created_at, :updated_at])
    end

    def deduction
        object.addition.as_json(except: [:created_at, :updated_at])
    end

    def other
        object.addition.as_json(except: [:created_at, :updated_at])
    end
end


        ===============================================================================================================================================
When in developement.rb file config.active_storage :local and in production is anything than local then for active storage attachment
class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :description, :path_name, :card_home_url, :card_insights_url, :banner_url, :body,
   :visibility, :publish_date, :card_home_url_alt, :card_insights_url_alt, :banner_url_alt

  attribute :publisher do
    if (user = User.find_by(id: object.publisher_id))
      {
        id: user.id,
        name: user.name,
        profile_picture: user.image.attached? ? s3_url(user.image) : nil
      }
    else
      nil
    end
  end

  private

  def serialize_image(image)
    {
      name: image.filename.to_s,
      content_type: image.content_type,
      url: s3_url(image)
    }
  end

  def s3_url(attachment)
    return nil if attachment.nil?
  
    if Rails.env.production? || Rails.application.config.active_storage.service == :amazon
      url_parts = attachment.url.split('?', 2)
      base_url = url_parts.first
      base_url
    else
      Rails.application.routes.url_helpers.rails_blob_url(attachment, host: "localhost:3000")
    end
  end  
end  
        
