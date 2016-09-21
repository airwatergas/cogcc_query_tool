class PlannedCasing < ActiveRecord::Base
  rails_admin do 
    label "Planned Casing"
    list do
      exclude_fields :casing_description, :cement_description
    end
    parent Sidetrack
  end
  belongs_to :sidetrack, :foreign_key => :sidetrack_id
  belongs_to :well, :foreign_key => :well_id
end