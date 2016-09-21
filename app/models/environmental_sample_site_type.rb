class EnvironmentalSampleSiteType < ActiveRecord::Base
  rails_admin do 
    label "Sample Site Type"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :id
      field :id do
        sort_reverse false
      end
    end
    navigation_label 'Environmental Sampling'
  end
end