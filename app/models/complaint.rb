class Complaint < ActiveRecord::Base
  rails_admin do 
    label "Complaint"
    list do
      exclude_fields 
      sort_by :complaint_date
      field :complaint_date do
        sort_reverse true
      end
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/ComplaintReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
      end
      field :facility_id do
        pretty_value do
          comp = bindings[:object]
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{comp.facility_id}&type=#{comp.facility_type}">#{comp.facility_id}</a>}.html_safe
        end
      end
      field :issue_assigned_to do
        pretty_value do
          comp = bindings[:object]
          if value == 'see complaint issue details table'
            %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
      field :issue_status do
        pretty_value do
          comp = bindings[:object]
          if value == 'see complaint issue details table'
            %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
      field :issue_description do
        pretty_value do
          comp = bindings[:object]
          if value == 'see complaint issue details table'
            %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
      field :issue_resolution do
        pretty_value do
          comp = bindings[:object]
          if value == 'see complaint issue details table'
            %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
    end
    show do
      exclude_fields 
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/ComplaintReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
     end
     field :facility_id do
       pretty_value do
         comp = bindings[:object]
         %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FacilityDetail.asp?facid=#{comp.facility_id}&type=#{comp.facility_type}">#{comp.facility_id}</a>}.html_safe
       end
     end
     field :issue_assigned_to do
       pretty_value do
         comp = bindings[:object]
         if value == 'see complaint issue details table'
           %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
         else
           value
         end
       end
     end
     field :issue_status do
       pretty_value do
         comp = bindings[:object]
         if value == 'see complaint issue details table'
           %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
         else
           value
         end
       end
     end
     field :issue_description do
       pretty_value do
         comp = bindings[:object]
         if value == 'see complaint issue details table'
           %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
         else
           value
         end
       end
     end
     field :issue_resolution do
       pretty_value do
         comp = bindings[:object]
         if value == 'see complaint issue details table'
           %{<a target="_blank" href="/cogcc/query/complaint_issue_detail?model_name=complaint_issue_detail&utf8=✓&f%5Bcomplaint%5D%5B75628%5D%5Bo%5D=is&f%5Bcomplaint%5D%5B75628%5D%5Bv%5D=#{comp.id}&query=">#{value}</a>}.html_safe
         else
           value
         end
       end
     end
    end
    navigation_label 'Inspections/Incidents'
    weight -10
  end
  belongs_to :well, :foreign_key => :well_id
  has_many :complaint_issue_details
  has_many :complaint_notifications
#  alias_attribute :facility, :location
#  belongs_to :location, :foreign_key => :facilty_id
end