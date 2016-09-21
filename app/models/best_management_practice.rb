class BestManagementPractice < ActiveRecord::Base
  rails_admin do 
    label "Best Management Practice"
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
      field :bmp_url do
        formatted_value do
          bmp = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{bmp.facility_id}">http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{bmp.facility_id}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields 
      field :bmp_url do
        formatted_value do
          bmp = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{bmp.facility_id}">http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{bmp.facility_id}</a>}.html_safe
        end
      end
    end
    parent Well
  end
  belongs_to :well, :foreign_key => :well_id
end