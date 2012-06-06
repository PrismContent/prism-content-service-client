module ContentService
  class EventPersistence
    require File.expand_path File.dirname(__FILE__), 'event'

    class << self
      def find_for_account_id(account_id, specific_date = nil)
        if specific_date
          find_specific_date_for_account(account_id, specific_date)
        else
          find_current_date_for_account(account_id)
        end
      end

      def enqueue(request)
        ContentService::Config.hydra.queue(request)
      end

      private
        def find_specific_date_for_account(account_id, specific_date)
          response = Typhoeus::Request.get dated_collection_url(account_id, specific_date)
          return_collection response
        end

        def find_current_date_for_account(account_id)
          response = Typhoeus::Request.get collection_url(account_id)
          return_collection response
        end

        def dated_collection_url(account_id, specific_date)
          "http://#{ContentService::Config.host}/v1/accounts/#{account_id}/active_content/events?start_date=#{specific_date.strftime('%Y-%m-%d')}"
        end

        def collection_url(account_id)
          "http://#{ContentService::Config.host}/v1/accounts/#{account_id}/active_content/events"
        end

        def return_collection(response)
          if response.code == 200
            return events_from(response)
          else
            return nil
          end
        end

        def events_from(response)
          JSON.parse(response.body)['events'].map{|attr| ContentService::Event.new(attr) }
        end

        def error_from(response)
          JSON.parse(response.body)['error']
        end
    end
  end
end
