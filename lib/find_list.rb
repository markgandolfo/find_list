module FindList
  class ActiveRecord::Base    
    # Returns a list of records to be used for a select.
    # Example
    # To use the default :id => 'id', :display => 'name' 
    # User.list
    #
    # Or you could specify one or many
    # User.list( :id => 'unique_field', :display => 'title')
    # 
    def self.list(options={}) #:doc
      id_column = options[:id].blank? ? :id : options.delete(:id).to_sym
      display_column = options[:display].blank? ? :name : options.delete(:display).to_sym
      find(:all, options).map { |x| [ x[id_column].to_s + ': ' + x[display_column], x[id_column] ] }
    end
  end
end

ActiveRecord::Base.send(:include, FindList)
