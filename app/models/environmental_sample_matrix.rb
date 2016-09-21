class EnvironmentalSampleMatrix < ActiveRecord::Base
  rails_admin do 
    label "Sample Matrices"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :result_count
      field :result_count do
        sort_reverse true
      end
    end
    navigation_label 'Environmental Sampling'
  end
end