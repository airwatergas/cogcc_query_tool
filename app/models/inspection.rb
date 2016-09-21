class Inspection < ActiveRecord::Base
  rails_admin do 
    label "Inspection"
    list do
      exclude_fields 
      sort_by :inspection_date
      field :inspection_date do
        sort_reverse true
      end
      field :document_id do
        pretty_value do
          %{<a target="_blank" href="http://165.127.23.127/DownloadDocument.aspx?DocumentId=#{value}">#{value}</a>}.html_safe
        end
      end
      field :document_number do
        pretty_value do
          if value < 600000000
            %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FieldInspectionDetail.asp?doc_num=#{value}">#{value}</a>}.html_safe
          else 
            value
          end
        end
      end
    end
    show do
      exclude_fields 
      field :document_id do
        pretty_value do
          %{<a target="_blank" href="http://165.127.23.127/DownloadDocument.aspx?DocumentId=#{value}">#{value}</a>}.html_safe
        end
      end
      field :document_number do
        pretty_value do
          if value < 600000000
            %{<a target="_blank" href="http://cogcc.state.co.us/cogis/FieldInspectionDetail.asp?doc_num=#{value}">#{value}</a>}.html_safe
          else 
            value
          end
        end
      end
    end
    navigation_label 'Inspections/Incidents'
  end
  belongs_to :well, :foreign_key => :well_id
end