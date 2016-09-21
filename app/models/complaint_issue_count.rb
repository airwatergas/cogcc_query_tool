class ComplaintIssueCount < ActiveRecord::Base
  rails_admin do 
    label "Issue Count"
    list do
      exclude_fields :created_at, :updated_at
      sort_by :occurrence_count
      field :occurrence_count do
        sort_reverse true
      end
    end
    parent Complaint
  end
end