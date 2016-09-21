class County < ActiveRecord::Base
  rails_admin do 
    list do
      exclude_fields 
      sort_by :name
      field :name do
        sort_reverse false
      end
    end
    navigation_label 'Related Resources'
  end
end