class EnvironmentalSampleReason < ActiveRecord::Base
  rails_admin do 
    label "Sample Reason"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :sample_count
      field :sample_count do
        sort_reverse true
      end
    end
    navigation_label 'Environmental Sampling'
  end
end