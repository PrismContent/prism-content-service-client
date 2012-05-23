module ContentService
  class Announcement
    require File.expand_path(File.dirname(__FILE__), 'announcement_persistence')

    include Prism::Serializers::JSON

    # not including the validations because this is a read-only interface

    @@attributes = [:title, :content, :id]

    attr_accessor *@@attributes

    class << self
      def find(account_id)
        ContentService::AnnouncementPersistence.find_for_account_id account_id
      end
    end

    def initialize(announcement_attr)
      announcement_attr ||= {}
      self.attributes = announcement_attr.slice *@@attributes
    end

    def attributes
      @@attributes.inject(HashWithIndifferentAccess.new) do |attrs, key|
        attrs.merge key => read_attribute_for_validation(key)
      end
    end

    def attributes=(attrs)
      attrs.each_pair{|k,v| send "#{k}=", v}
    end

    def read_attribute_for_validation(key)
      send key
    end

    def service_errors
      @service_errors ||= {}
    end

    private
      def service_errors=(errors)
        @service_errors = errors
      end
  end
end
