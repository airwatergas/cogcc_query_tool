class InspectionDetail < ActiveRecord::Base
  rails_admin do 
    label "Inspection Details"
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
    end
    parent Inspection
  end
  belongs_to :inspection, :foreign_key => :inspection_id
  belongs_to :well, :foreign_key => :well_id
end