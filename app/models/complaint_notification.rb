class ComplaintNotification < ActiveRecord::Base
  rails_admin do 
    label "Complaint Notification"
    list do
      exclude_fields 
      sort_by :complaint_id
      field :complaint_id do
        sort_reverse true
      end
    end
    parent Complaint
  end
  belongs_to :complaint, :foreign_key => :complaint_id
end