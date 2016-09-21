class ApprovalCondition < ActiveRecord::Base
  rails_admin do 
    label "Approval Conditions"
    list do
      exclude_fields 
      sort_by :id
      field :id do
        sort_reverse false
      end
      field :coa_url do
        formatted_value do
          coa = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{coa.facility_id}">http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{coa.facility_id}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields 
      field :coa_url do
        formatted_value do
          coa = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{coa.facility_id}">http://cogcc.state.co.us/cogis/COAs.cfm?facid=#{coa.facility_id}</a>}.html_safe
        end
      end
    end
    parent Well
  end
  belongs_to :well, :foreign_key => :well_id
end