class MechanicalIntegrityTest < ActiveRecord::Base
  rails_admin do
    label "Mechanical Integrity Test"
    list do
      exclude_fields 
      sort_by :test_date
      field :test_date do
        sort_reverse true
      end
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/MITReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields 
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/MITReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Inspections/Incidents'
  end
  belongs_to :well, :foreign_key => :well_id
end