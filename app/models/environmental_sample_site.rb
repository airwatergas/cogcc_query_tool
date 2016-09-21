class EnvironmentalSampleSite < ActiveRecord::Base
  rails_admin do 
    label "Sample Site"
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
      field :sample_site_id do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/COGIS/EnviroSample.asp?facid=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields
      field :sample_site_id do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/COGIS/EnviroSample.asp?facid=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Environmental Sampling'
    weight -5
  end
  has_many :environmental_samples
end