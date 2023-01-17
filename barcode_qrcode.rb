add following gems 

gem "rqrcode"
gem "chunky_png", "~> 1.4"

rails active_storage:install

# suppoose you are having post model 
class Post < ApplicationRecord
    has_one_attached :qr_code
include Rails.application.routes.url_helpers
    require "rqrcode"
    after_create :generate_qr
    def generate_qr
        qr_url = url_for(controller: "posts",
        action: "show" ,
        id: self.id ,
        only_path: false ,
        host: "testin.com",
        source: "from_qr"
        )
    qrcode = RQRCode::QRCode.new(qr_url)

    png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 120
      )
      image_name = SecureRandom.hex
      IO.binwrite("tmp/#{image_name}.png", png.to_s)
      blob= ActiveStorage::Blob.create_and_upload!(
        io: File.open("tmp/#{image_name}.png"),
        filename: image_name ,
        content_type: "png"
      )

      self.qr_code.attach(blob)

    end
end


# in index or show page ===>>>>>
<strong>QR code :</strong>
    <%= image_tag(post.qr_code) if post.qr_code.attached?  %>

    This is all we are done to create QR code now we willl shift our code 


    ##### Note That We replace Post With self #####
    in app/services/generate_qr.rb
    class GenerateQr < ApplicationService
      attr_reader :post
      include Rails.application.routes.url_helpers
      require "rqrcode"
  
      def initialize(post)
          @post = post
      end
      def call
          qr_url = url_for(controller: "posts",
              action: "show" ,
              id: post.id ,
              only_path: false ,
              host: "testin.com",
              source: "from_qr"
              )
          qrcode = RQRCode::QRCode.new(qr_url)
      
          png = qrcode.as_png(
              bit_depth: 1,
              border_modules: 4,
              color_mode: ChunkyPNG::COLOR_GRAYSCALE,
              color: "black",
              file: nil,
              fill: "white",
              module_px_size: 6,
              resize_exactly_to: false,
              resize_gte_to: false,
              size: 120
            )
            image_name = SecureRandom.hex
            IO.binwrite("tmp/#{image_name}.png", png.to_s)
            blob= ActiveStorage::Blob.create_and_upload!(
              io: File.open("tmp/#{image_name}.png"),
              filename: image_name ,
              content_type: "png"
            )
      
            post.qr_code.attach(blob)
      
          
      end
  end

  in app/services/application_service.rb
  class ApplicationService 
    def self.call(*args , &block)
        new(*args, &block).call
    end
end

in post.rb model 

class Post < ApplicationRecord
  has_one_attached :qr_code

  after_create :generate_qr
  def generate_qr
      GenerateQr.call(self)
  end
  
end