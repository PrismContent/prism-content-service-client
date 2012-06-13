module ContentService
  class Birthday
    require File.expand_path(File.dirname(__FILE__), 'birthday_persistence')

    include Prism::Serializers::JSON

    @@attributes = [:name, :id, :month, :year, :day]

    attr_accessor *@@attributes

    class << self
      def find(account_id)
        ContentService::BirthdayPersistence.find_for_account_id account_id
      end
    end

    def initialize(birthday_attr)
      birthday_attr ||= {}
      birthday_attr =  HashWithIndifferentAccess.new(birthday_attr)

      self.attributes = birthday_attr.slice *@@attributes
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
