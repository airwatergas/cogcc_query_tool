class FacilityType < ActiveRecord::Base
  rails_admin do 
    label "Facility Type"
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
    end
    navigation_label 'Related Resources'
  end
end