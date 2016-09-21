class EnvironmentalSampleWellDistance < ActiveRecord::Base
  rails_admin do 
    label "Site to Well Distance"
    list do
      exclude_fields
      sort_by :distance_meters
      field :distance_meters do
        sort_reverse false
      end
    end
    parent EnvironmentalSampleSite
  end
  belongs_to :environmental_sample_site, :foreign_key => :environmental_sample_site_id
  belongs_to :well, :foreign_key => :well_id
end