class DispositionCode < ActiveRecord::Base
  rails_admin do 
    label "Disposition Code"
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