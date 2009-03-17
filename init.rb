# Include hook code here
class << ActiveRecord::Base
  def has_many_without_deleted(association_id, options = {}, &extension)
    with_deleted = options.delete :with_deleted
    returning has_many_with_deleted(association_id, options, &extension) do
      if options[:through] && !with_deleted
        reflection = reflect_on_association(association_id)
        collection_reader_method(reflection, ParanoidSimpler::HasManyThroughWithoutDeletedSoftlyAssociation)
        collection_accessor_methods(reflection, ParanoidSimpler::HasManyThroughWithoutDeletedSoftlyAssociation, false)
      end
    end
  end
end
ActiveRecord::Base.send :include, ParanoidSimpler