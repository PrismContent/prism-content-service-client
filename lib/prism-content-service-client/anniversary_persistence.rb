module ContentService
  class AnniversaryPersistence
    require File.expand_path File.dirname(__FILE__), 'anniversary'

    class << self
      def find_for_account_id(account_id)
        response = Typhoeus::Request.get collection_url(account_id)
        return_collection response
      end

      def find_for_date_and_account_id(a_date, account_id)
        response = Typhoeus::Request.get "#{collection_url(account_id)}?start_date=#{a_date}"
        return_collection response
      end

      def enqueue(request)
        ContentService::Config.hydra.queue(request)
      end

      private
        def collection_url(account_id)
          "http://#{ContentService::Config.host}/v1/accounts/#{account_id}/active_content/anniversaries"
        end

        def return_collection(response)
          if response.code == 200
            return anniversaries_from(response)
          else
            return nil
          end
        end

        def anniversaries_from(response)
          JSON.parse(response.body)['anniversaries'].map{|attr| ContentService::Anniversary.new(attr) }
        end

        def error_from(response)
          JSON.parse(response.body)['error']
        end
    end
  end
end
