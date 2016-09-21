class InspectionType < ActiveRecord::Base
  rails_admin do 
    label "Inspection Type"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :name
      field :name do
        sort_reverse false
      end
    end
    parent Inspection
  end
end