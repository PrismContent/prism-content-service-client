module ContentService
  class Event
    require File.expand_path(File.dirname(__FILE__), 'event_persistence')

    include Prism::Serializers::JSON

    # not including the validations because this is a read-only interface

    @@attributes = [:name, :description, :starting_at, :location_name, :location_code, :document_definition_id, :id, :canceled_at, :canceled]

    attr_accessor *@@attributes

    class << self
      def find(account_id, specific_date = nil)
        ContentService::EventPersistence.find_for_account_id account_id, specific_date
      end
    end

    def starting_at=(val)
      @starting_at = val.is_a?(Time) ? val : val.to_time
    end

    def initialize(event_attr)
      event_attr ||= {}
      event_attr = HashWithIndifferentAccess.new(event_attr)

      event_attr.merge!(:starting_at => Time.parse(event_attr[:starting_at])) if event_attr[:starting_at].is_a?(String) && !event_attr[:starting_at].blank?

      self.attributes = event_attr.slice *@@attributes
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
