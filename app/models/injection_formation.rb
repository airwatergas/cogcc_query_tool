class InjectionFormation < ActiveRecord::Base
  rails_admin do 
    label "Injection Formations"
    list do
      exclude_fields
      sort_by :id
      field :id do
        sort_reverse false
      end
    end
    parent InjectionFacility
  end
  belongs_to :injection_facility, :foreign_key => :injection_facility_id
end