class EnvironmentalSampleResult < ActiveRecord::Base
  rails_admin do 
    label "Sample Result"
    list do
      exclude_fields :environmental_parameter_id
      sort_by :id
      field :id do
        sort_reverse false
      end
    end
    parent EnvironmentalSample
  end
  belongs_to :environmental_sample, :foreign_key => :environmental_sample_id
  belongs_to :environmental_sample_site, :foreign_key => :environmental_sample_site_id
end