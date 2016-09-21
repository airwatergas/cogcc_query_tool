class WellStatusCode < ActiveRecord::Base
  rails_admin do 
    label "Well Status Code"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :code
      field :code do
        sort_reverse false
      end
    end
    navigation_label 'Related Resources'
  end
end