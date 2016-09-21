class Noav < ActiveRecord::Base
  rails_admin do 
    label "Notice of Alleged Violation"
    list do
      exclude_fields 
      sort_by :violation_date
      field :violation_date do
        sort_reverse true
      end
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/NOAVReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields 
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/NOAVReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Inspections/Incidents'
  end
  belongs_to :well, :foreign_key => :well_id
end