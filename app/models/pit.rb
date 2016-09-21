class Pit < ActiveRecord::Base
  rails_admin do 
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
      field :id do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{value}&type=PIT">#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields 
      field :id do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{value}&type=PIT">#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Facilities'
  end
end