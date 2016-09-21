class InjectionWell < ActiveRecord::Base
  rails_admin do 
    label "Injection Wells"
    list do
      exclude_fields
      sort_by :id
      field :id do
        sort_reverse false
      end
      field :well_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields
      field :well_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
    end
    parent InjectionFacility
  end
  belongs_to :injection_facility, :foreign_key => :injection_facility_id
  belongs_to :well, :foreign_key => :well_id
end