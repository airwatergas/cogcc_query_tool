class RemediationMediaDetail < ActiveRecord::Base
  rails_admin do 
    label "Remediation Media Detail"
    list do
      exclude_fields 
      sort_by :remediation_id
      field :remediation_id do
        sort_reverse true
      end
    end
    parent Remediation
  end
  belongs_to :remediation, :foreign_key => :remediation_id
end