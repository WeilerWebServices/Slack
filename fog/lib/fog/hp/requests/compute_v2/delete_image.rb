module Fog
  module Compute
    class HPV2
      class Real

        # Delete an image
        #
        # ==== Parameters
        # * 'image_id'<~String> - UUId of image to delete
        #
        def delete_image(image_id)
          request(
            :expects  => 204,
            :method   => 'DELETE',
            :path     => "images/#{image_id}"
          )
        end

      end

      class Mock

        def delete_image(image_id)
          response = Excon::Response.new
          if image = list_images_detail.body['images'].detect {|_| _['id'] == image_id}
            if image['status'] == 'SAVING'
              response.status = 409
              raise(Excon::Errors.status_error({:expects => 202}, response))
            else
              self.data[:last_modified][:images].delete(image_id)
              self.data[:images].delete(image_id)
              response.status = 202
            end
            response
          else
            raise Fog::Compute::HPV2::NotFound
          end

        end

      end
    end
  end
end
