class Facility < ActiveRecord::Base
  rails_admin do 
    label "Other Facilities"
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
      field :id do
        pretty_value do
          fac = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{fac.id}&type=#{fac.facility_type}">#{fac.id}</a>}.html_safe
        end
      end
      field :facility_detail_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
      field :related_facilities_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields
      field :id do
        pretty_value do
          fac = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{fac.id}&type=#{fac.facility_type}">#{fac.id}</a>}.html_safe
        end
      end
      field :facility_detail_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
      field :related_facilities_url do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/#{value}">http://cogcc.state.co.us/cogis/#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Facilities'
  end
end