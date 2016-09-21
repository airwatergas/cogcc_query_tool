class FormationTreatment < ActiveRecord::Base
  rails_admin do 
    label "Formation Treatment"
    list do
      exclude_fields 
    end

    parent CompletedInterval
  end

  belongs_to :completed_interval, :foreign_key => :completed_interval_id
  belongs_to :sidetrack, :foreign_key => :sidetrack_id
  belongs_to :well, :foreign_key => :well_id
end