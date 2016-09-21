class WellDocument < ActiveRecord::Base
  rails_admin do 
    label "Well Document"
    list do
      exclude_fields :date_suspect, :well_link_id, :download_url
      sort_by :document_date
      field :document_date do
        sort_reverse true
      end
      field :document_id do
        pretty_value do
          %{<a target="_blank" href="http://ogccweblink.state.co.us/DownloadDocument.aspx?DocumentId=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    show do
      exclude_fields :date_suspect, :well_link_id, :download_url
      field :document_id do
        pretty_value do
          %{<a target="_blank" href="http://ogccweblink.state.co.us/DownloadDocument.aspx?DocumentId=#{value}">#{value}</a>}.html_safe
        end
      end
    end
    navigation_label 'Well Metadata'
  end
  belongs_to :well, :foreign_key => :well_id
end