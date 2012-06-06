module ContentService
  class AnnouncementPersistence
    require File.expand_path File.dirname(__FILE__), 'announcement'

    class << self
      def find_for_account_id(account_id, specific_date = nil)
        response = Typhoeus::Request.get collection_url(account_id)
        return_collection response
      end

      def enqueue(request)
        ContentService::Config.hydra.queue(request)
      end

      private
        def collection_url(account_id)
          "http://#{ContentService::Config.host}/v1/accounts/#{account_id}/active_content/announcements"
        end

        def return_collection(response)
          if response.code == 200
            return announcements_from(response)
          else
            return nil
          end
        end

        def announcements_from(response)
          JSON.parse(response.body)['announcements'].map(&:values).flatten.map{|attr| ContentService::Announcement.new(attr) }
        end

        def error_from(response)
          JSON.parse(response.body)['error']
        end
    end
  end
end
