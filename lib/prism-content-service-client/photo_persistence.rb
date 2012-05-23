module ContentService
  class PhotoPersistence
    require File.expand_path File.dirname(__FILE__), 'photo'

    class << self
      def find_for_account_id(account_id)
        response = Typhoeus::Request.get collection_url(account_id)
        return_collection response
      end

      def enqueue(request)
        ResidentialService::Config.hydra.queue(request)
      end

      private
        def collection_url(account_id)
          "http://#{ResidentialService::Config.host}/v1/accounts/#{account_id}/active_content/photos"
        end

        def return_collection(response)
          if response.code == 200
            return photos_from(response)
          else
            return nil
          end
        end

        def photos_from(response)
          JSON.parse(response.body)['photos'].map(&:values).flatten.map{|attr| ContentService::Photo.new(attr) }
        end

        def error_from(response)
          JSON.parse(response.body)['error']
        end
    end
  end
end
