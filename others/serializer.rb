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
        