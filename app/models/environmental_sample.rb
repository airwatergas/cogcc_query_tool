class EnvironmentalSample < ActiveRecord::Base
  rails_admin do 
    label "Sample"
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
      field :sample_id do
        pretty_value do
          samp = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/COGIS/EnviroSample.asp?facid=#{samp.sample_site_id}&SampleID=#{samp.sample_id}&External=Y">#{samp.sample_id}</a>}.html_safe
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
      field :sample_id do
        pretty_value do
          samp = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/COGIS/EnviroSample.asp?facid=#{samp.sample_site_id}&SampleID=#{samp.sample_id}&External=Y">#{samp.sample_id}</a>}.html_safe
        end
      end
    end
    navigation_label 'Environmental Sampling'
  end
  belongs_to :environmental_sample_site, :foreign_key => :environmental_sample_site_id
  has_many :environmental_sample_results
end