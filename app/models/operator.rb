class Operator < ActiveRecord::Base
  rails_admin do 
    list do
      exclude_fields 
      sort_by :name
      field :name do
        sort_reverse false
      end
    end
    navigation_label 'Facility Metadata'
    parent Well
  end
end