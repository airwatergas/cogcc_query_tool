class Location < ActiveRecord::Base
  rails_admin do 
    list do
      exclude_fields 
      field :id do
        sort_reverse false
      end
      field :id do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{value}&type=LOCATION">#{value}</a>}.html_safe
        end
      end
      field :location_details_url do
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
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{value}&type=LOCATION">#{value}</a>}.html_safe
        end
      end
      field :location_details_url do
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
    weight -15
  end
end