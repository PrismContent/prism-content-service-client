module ContentService
  class Anniversary
    require File.expand_path(File.dirname(__FILE__), 'anniversary_persistence')

    include Prism::Serializers::JSON

    @@attributes = [:name, :id, :month, :year, :day]

    attr_accessor *@@attributes

    class << self
      def find(account_id, start_date = nil)
        if start_date.blank?
          ContentService::AnniversaryPersistence.find_for_date_and_account_id start_date, account_id
        else
          ContentService::AnniversaryPersistence.find_for_account_id account_id
        end
      end
    end

    def initialize(anniversary_attr)
      anniversary_attr ||= {}
      anniversary_attr =  HashWithIndifferentAccess.new(anniversary_attr)

      self.attributes = anniversary_attr.slice *@@attributes
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
