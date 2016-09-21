class CasingStringType < ActiveRecord::Base
  rails_admin do 
    label "Casing String Type"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :id
      field :id do
        sort_reverse false
      end
    end
    navigation_label 'Related Resources'
  end
end