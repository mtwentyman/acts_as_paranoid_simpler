module ParanoidSimpler
  def self.included(base) # :nodoc:
    base.extend ClassMethods
  end

  module ClassMethods
    
    def acts_as_paranoid_simple
      unless paranoid?
        acts_as_paranoid
        include InstanceMethods
      end
    end

    module InstanceMethods #:nodoc:
      def self.included(base) # :nodoc:
        base.extend ClassMethods
      end

      module ClassMethods

        protected

          def with_deleted_scope(&block)
            with_scope({:find => { :conditions => "#{table_name}.#{deleted_attribute} IS NULL" } }, :merge, &block)
          end

          def with_only_deleted_scope(&block)
            with_scope({:find => { :conditions => "#{table_name}.#{deleted_attribute} IS NOT NULL" } }, :merge, &block)
          end

      end
    end
  end
end
