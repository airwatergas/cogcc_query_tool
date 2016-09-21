class WellDocumentCount < ActiveRecord::Base
  rails_admin do 
    label "Distinct Document Name"
    list do
      exclude_fields
      sort_by :document_count
      field :document_count do
        sort_reverse true
      end
    end
    parent WellDocument
  end
end