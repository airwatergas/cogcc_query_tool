class SpillRelease < ActiveRecord::Base
  rails_admin do 
    label "Spills or Release"
    list do
      exclude_fields :api_number
      sort_by :submit_date
      field :submit_date do
        sort_reverse true
      end
      field :document_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields :api_number
      field :document_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Inspections/Incidents'
  end
  belongs_to :well, :foreign_key => :well_id
end