class CompletedCasing < ActiveRecord::Base
  rails_admin do 
    label "Completed Casing"
    list do
      exclude_fields 
    end

    parent Sidetrack
  end

  belongs_to :sidetrack, :foreign_key => :sidetrack_id
  belongs_to :well, :foreign_key => :well_id
end