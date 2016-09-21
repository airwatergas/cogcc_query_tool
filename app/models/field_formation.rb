class FieldFormation < ActiveRecord::Base
  rails_admin do 
    label "Field Formation"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :field_name
      field :field_name do
        sort_reverse false
      end
    end
    parent Field
  end
end