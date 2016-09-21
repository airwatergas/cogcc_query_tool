class Remediation < ActiveRecord::Base
  rails_admin do 
    label "Remediation"
    list do
      exclude_fields :document_url
      sort_by :submit_date
      field :submit_date do
        sort_reverse true
      end
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/RemediationReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
      end
      field :related_documents_url do
        pretty_value do
          %{<a target="_blank" href="#{value}">#{value}</a>}.html_safe
        end
      end
      field :media_extent do
        pretty_value do
          remed = bindings[:object]
          if value == 'see remediation media details table'
            %{<a target="_blank" href="/cogcc/query/remediation_media_detail?model_name=remediation_media_detail&utf8=✓&f%5Bremediation%5D%5B07923%5D%5Bo%5D=is&f%5Bremediation%5D%5B07923%5D%5Bv%5D=#{remed.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
      field :media_how_determined do
        pretty_value do
          remed = bindings[:object]
          if value == 'see remediation media details table'
            %{<a target="_blank" href="/cogcc/query/remediation_media_detail?model_name=remediation_media_detail&utf8=✓&f%5Bremediation%5D%5B07923%5D%5Bo%5D=is&f%5Bremediation%5D%5B07923%5D%5Bv%5D=#{remed.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
    end
    show do
      exclude_fields :document_url
      field :document_number do
        pretty_value do
          %{<a target="_blank" href="http://cogcc.state.co.us/cogis/RemediationReport.asp?doc_num=#{value}">#{value}</a>}.html_safe
        end
      end
      field :related_documents_url do
        pretty_value do
          %{<a target="_blank" href="#{value}">#{value}</a>}.html_safe
        end
      end
      field :media_extent do
        pretty_value do
          remed = bindings[:object]
          if value == 'see remediation media details table'
            %{<a target="_blank" href="/cogcc/query/remediation_media_detail?model_name=remediation_media_detail&utf8=✓&f%5Bremediation%5D%5B07923%5D%5Bo%5D=is&f%5Bremediation%5D%5B07923%5D%5Bv%5D=#{remed.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
      field :media_how_determined do
        pretty_value do
          remed = bindings[:object]
          if value == 'see remediation media details table'
            %{<a target="_blank" href="/cogcc/query/remediation_media_detail?model_name=remediation_media_detail&utf8=✓&f%5Bremediation%5D%5B07923%5D%5Bo%5D=is&f%5Bremediation%5D%5B07923%5D%5Bv%5D=#{remed.id}&query=">#{value}</a>}.html_safe
          else
            value
          end
        end
      end
    end
    navigation_label 'Inspections/Incidents'
  end
  belongs_to :well, :foreign_key => :well_id
  has_many :remediation_media_details
end