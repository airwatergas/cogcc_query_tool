# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "approval_conditions", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "well_id"
    t.integer "facility_id"
    t.string  "well_api_number",        limit: 12
    t.string  "county_name",            limit: 10
    t.string  "operator_name",          limit: 50
    t.string  "source_document_form",   limit: 30
    t.integer "source_document_number"
    t.date    "source_document_date"
    t.text    "conditions"
  end

# Could not dump table "bedrock_aquifers" because of following StandardError
#   Unknown type 'geometry(MultiPolygon,26913)' for column 'geom'

  create_table "best_management_practices", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "well_id"
    t.integer "facility_id"
    t.string  "well_api_number",        limit: 12
    t.string  "county_name",            limit: 10
    t.string  "operator_name",          limit: 50
    t.string  "source_document_form",   limit: 30
    t.integer "source_document_number"
    t.date    "source_document_date"
    t.string  "bmp_type",               limit: 250
    t.text    "bmp_description"
  end

  create_table "bmp_types", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name",      limit: 250
    t.integer "bmp_count"
  end

  create_table "casing_string_types", force: :cascade do |t|
    t.string "name",        limit: 20
    t.string "description", limit: 255
    t.date   "created_at"
    t.date   "updated_at"
  end

  create_table "commission_orders", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "order_number",    limit: 20
    t.date    "order_dated"
    t.integer "order_year",      limit: 2
    t.integer "order_month",     limit: 2
    t.string  "order_url",       limit: 100
    t.string  "keywords",        limit: 250
    t.boolean "is_la_plata"
    t.boolean "is_adams"
    t.boolean "is_arapahoe"
    t.boolean "is_brighton"
    t.boolean "is_broomfield"
    t.boolean "is_elbert"
    t.boolean "is_erie"
    t.boolean "is_fort_collins"
    t.boolean "is_longmont"
    t.text    "order_text"
  end

  create_table "complaint_issue_counts", force: :cascade do |t|
    t.string  "issue",            limit: 30
    t.integer "occurrence_count", limit: 2
  end

  create_table "complaint_issue_details", force: :cascade do |t|
    t.integer  "complaint_id"
    t.string   "issue",        limit: 30
    t.string   "assigned_to",  limit: 20
    t.string   "status",       limit: 35
    t.text     "description"
    t.text     "resolution"
    t.boolean  "letter_sent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "complaint_issue_details", ["complaint_id"], name: "index_complaint_issue_details_on_complaint_id", using: :btree
  add_index "complaint_issue_details", ["issue"], name: "index_complaint_issue_details_on_issue", using: :btree

  create_table "complaint_notifications", force: :cascade do |t|
    t.integer  "complaint_id"
    t.date     "notification_date"
    t.integer  "notification_year",  limit: 2
    t.integer  "notification_month", limit: 2
    t.string   "agency",             limit: 30
    t.string   "contact",            limit: 30
    t.text     "response_details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "complaint_notifications", ["complaint_id"], name: "index_complaint_notifications_on_complaint_id", using: :btree
  add_index "complaint_notifications", ["notification_date"], name: "index_complaint_notifications_on_notification_date", using: :btree
  add_index "complaint_notifications", ["notification_month"], name: "index_complaint_notifications_on_notification_month", using: :btree
  add_index "complaint_notifications", ["notification_year"], name: "index_complaint_notifications_on_notification_year", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.date     "incident_date"
    t.integer  "document_number"
    t.integer  "well_id"
    t.string   "well_api_number",        limit: 12
    t.string   "well_name_no",           limit: 60
    t.integer  "facility_id"
    t.string   "facility_type",          limit: 20
    t.string   "county_name",            limit: 10
    t.date     "complaint_date"
    t.integer  "complaint_year",         limit: 2
    t.integer  "complaint_month",        limit: 2
    t.string   "complaint_issues",       limit: 100
    t.string   "issue_assigned_to",      limit: 35
    t.string   "issue_status",           limit: 35
    t.text     "issue_description"
    t.text     "issue_resolution"
    t.boolean  "issue_letter_sent"
    t.string   "operator_name",          limit: 50
    t.integer  "operator_number"
    t.string   "operator_contact",       limit: 50
    t.string   "complainant_name",       limit: 50
    t.string   "complainant_address",    limit: 100
    t.string   "complainant_connection", limit: 30
    t.string   "qtr_qtr",                limit: 6
    t.string   "section",                limit: 2
    t.string   "township",               limit: 4
    t.string   "range",                  limit: 4
    t.string   "meridian",               limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "complaints", ["complaint_date"], name: "index_complaints_on_complaint_date", using: :btree
  add_index "complaints", ["complaint_month"], name: "index_complaints_on_complaint_month", using: :btree
  add_index "complaints", ["complaint_year"], name: "index_complaints_on_complaint_year", using: :btree
  add_index "complaints", ["well_api_number"], name: "index_complaints_on_well_api_number", using: :btree
  add_index "complaints", ["well_id"], name: "index_complaints_on_well_id", using: :btree

  create_table "completed_casings", force: :cascade do |t|
    t.integer  "well_id"
    t.integer  "sidetrack_id"
    t.string   "casing_string_type",   limit: 10
    t.string   "casing_hole_size",     limit: 8
    t.string   "casing_size",          limit: 8
    t.integer  "casing_top"
    t.integer  "casing_depth"
    t.string   "casing_weight",        limit: 10
    t.integer  "cement_sacks"
    t.integer  "cement_top"
    t.integer  "cement_bottom"
    t.string   "cement_method_grade",  limit: 18
    t.integer  "cement_depth"
    t.boolean  "is_additional_cement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completed_casings", ["casing_string_type"], name: "index_completed_casings_on_casing_string_type", using: :btree
  add_index "completed_casings", ["sidetrack_id"], name: "index_completed_casings_on_sidetrack_id", using: :btree
  add_index "completed_casings", ["well_id"], name: "index_completed_casings_on_well_id", using: :btree

  create_table "completed_formations", force: :cascade do |t|
    t.integer  "well_id"
    t.integer  "sidetrack_id"
    t.string   "formation_name", limit: 30
    t.integer  "log_top"
    t.integer  "log_bottom"
    t.string   "cored",          limit: 1
    t.boolean  "dst"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completed_formations", ["sidetrack_id"], name: "index_completed_formations_on_sidetrack_id", using: :btree
  add_index "completed_formations", ["well_id"], name: "index_completed_formations_on_well_id", using: :btree

  create_table "completed_interval_status_codes", force: :cascade do |t|
    t.string   "code",        limit: 2
    t.string   "name",        limit: 30
    t.string   "description", limit: 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_intervals", force: :cascade do |t|
    t.integer  "well_id"
    t.integer  "sidetrack_id"
    t.string   "formation_code",         limit: 6
    t.string   "formation_name",         limit: 50
    t.string   "status_code",            limit: 2
    t.date     "status_date"
    t.date     "first_production_date"
    t.string   "choke_size",             limit: 10
    t.boolean  "open_hole_completion"
    t.boolean  "commingled"
    t.string   "production_method",      limit: 150
    t.integer  "perf_bottom"
    t.integer  "perf_top"
    t.integer  "perf_holes_number"
    t.string   "perf_hole_size",         limit: 10
    t.string   "tubing_size",            limit: 12
    t.integer  "tubing_setting_depth"
    t.integer  "tubing_packer_depth"
    t.boolean  "tubing_multiple_packer"
    t.integer  "open_hole_top"
    t.integer  "open_hole_bottom"
    t.date     "test_date"
    t.string   "test_method",            limit: 15
    t.string   "hours_tested",           limit: 10
    t.string   "test_gas_type",          limit: 10
    t.string   "gas_disposal",           limit: 11
    t.string   "bbls_h20",               limit: 10
    t.string   "bbls_oil",               limit: 10
    t.string   "btu_gas",                limit: 10
    t.string   "calc_bbls_h20",          limit: 10
    t.string   "calc_bbls_oil",          limit: 10
    t.string   "calc_gor",               limit: 10
    t.string   "calc_mcf_gas",           limit: 10
    t.string   "casing_press",           limit: 10
    t.string   "gravity_oil",            limit: 10
    t.string   "mcf_gas",                limit: 10
    t.string   "tubing_press",           limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calc_gor_int",           limit: 8
  end

  add_index "completed_intervals", ["sidetrack_id"], name: "index_completed_intervals_on_sidetrack_id", using: :btree
  add_index "completed_intervals", ["status_code"], name: "index_completed_intervals_on_status_code", using: :btree
  add_index "completed_intervals", ["well_id"], name: "index_completed_intervals_on_well_id", using: :btree

  create_table "counties", force: :cascade do |t|
    t.string  "api_code",         limit: 3
    t.string  "name",             limit: 11
    t.integer "min_api_sequence"
    t.integer "max_api_sequence"
    t.integer "_5_10"
    t.integer "_10_15"
    t.integer "_15_20"
    t.integer "_20_25"
    t.integer "_25_30"
    t.integer "_30_35"
    t.integer "_35_40"
    t.integer "_40_45"
    t.integer "_45_50"
    t.integer "_50_60"
    t.integer "_60_90"
    t.integer "_90"
    t.integer "_5"
  end

  create_table "environmental_sample_matrices", force: :cascade do |t|
    t.string  "name",         limit: 8
    t.integer "result_count"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "environmental_sample_parameters", force: :cascade do |t|
    t.string  "name",           limit: 70
    t.string  "alternate_name", limit: 35
    t.integer "result_count"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "environmental_sample_reasons", force: :cascade do |t|
    t.string  "reason",       limit: 50
    t.integer "sample_count"
  end

  create_table "environmental_sample_results", force: :cascade do |t|
    t.integer  "environmental_sample_site_id"
    t.integer  "environmental_sample_id"
    t.integer  "environmental_parameter_id"
    t.integer  "sample_id"
    t.string   "method_code",                  limit: 35
    t.string   "parameter_name",               limit: 35
    t.string   "parameter_description",        limit: 70
    t.float    "result_value"
    t.string   "units",                        limit: 15
    t.float    "detection_limit"
    t.string   "fraction_type",                limit: 10
    t.string   "qualifier",                    limit: 7
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "environmental_sample_site_types", force: :cascade do |t|
    t.string  "facility_type", limit: 20
    t.string  "description",   limit: 50
    t.integer "site_count",    limit: 2
    t.date    "created_at"
    t.date    "updated_at"
  end

# Could not dump table "environmental_sample_sites" because of following StandardError
#   Unknown type 'geometry(Point,26913)' for column 'geom_26913'

  create_table "environmental_sample_well_distances", force: :cascade do |t|
    t.integer "environmental_sample_site_id"
    t.integer "well_id"
    t.string  "facility_type",                limit: 20
    t.integer "facility_id"
    t.string  "well_api_number",              limit: 12
    t.string  "matrix_types",                 limit: 20
    t.integer "sample_count"
    t.float   "distance_meters"
  end

  create_table "environmental_samples", force: :cascade do |t|
    t.integer "environmental_sample_site_id"
    t.integer "sample_site_id"
    t.integer "sample_id"
    t.date    "sample_date"
    t.integer "sample_year",                  limit: 2
    t.integer "sample_month",                 limit: 2
    t.string  "sample_reason",                limit: 50
    t.string  "matrix",                       limit: 8
    t.integer "lab_id"
    t.string  "lab_sample_id",                limit: 30
    t.string  "sampler",                      limit: 35
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "facilities", force: :cascade do |t|
    t.string  "facility_type",          limit: 30
    t.string  "facility_name",          limit: 35
    t.string  "facility_number",        limit: 14
    t.string  "status_code",            limit: 2
    t.date    "status_date"
    t.string  "operator_name",          limit: 50
    t.integer "operator_number"
    t.string  "field_name",             limit: 30
    t.integer "field_number"
    t.float   "longitude"
    t.float   "latitude"
    t.string  "county_name",            limit: 10
    t.string  "county_api",             limit: 3
    t.string  "plss_location",          limit: 25
    t.text    "comments"
    t.string  "facility_detail_url",    limit: 70
    t.string  "related_facilities_url", limit: 35
    t.date    "created_at"
    t.date    "updated_at"
    t.integer "status_year",            limit: 2
  end

  create_table "facility_status_codes", force: :cascade do |t|
    t.string   "code",        limit: 2
    t.string   "name",        limit: 30
    t.string   "description", limit: 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facility_types", force: :cascade do |t|
    t.string "name", limit: 50
  end

  create_table "field_formations", force: :cascade do |t|
    t.string  "field_name",   limit: 30
    t.integer "field_code"
    t.string  "formation_1",  limit: 50
    t.string  "formation_2",  limit: 50
    t.string  "formation_3",  limit: 50
    t.string  "formation_4",  limit: 50
    t.string  "formation_5",  limit: 50
    t.string  "formation_6",  limit: 50
    t.string  "formation_7",  limit: 50
    t.string  "formation_8",  limit: 50
    t.string  "formation_9",  limit: 50
    t.string  "formation_10", limit: 50
    t.string  "formation_11", limit: 50
    t.string  "formation_12", limit: 50
    t.date    "updated_at"
  end

  create_table "fields", force: :cascade do |t|
    t.string  "name",               limit: 30
    t.integer "code"
    t.string  "discovery_well_api", limit: 12
    t.integer "discovery_year",     limit: 2
    t.integer "abandon_year",       limit: 2
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "formation_treatments", force: :cascade do |t|
    t.integer  "well_id"
    t.integer  "sidetrack_id"
    t.integer  "completed_interval_id"
    t.string   "treatment_type",           limit: 20
    t.date     "treatment_date"
    t.date     "treatment_end_date"
    t.text     "treatment_summary"
    t.integer  "total_fluid_used"
    t.integer  "max_pressure"
    t.integer  "total_gas_used"
    t.string   "fluid_density",            limit: 10
    t.string   "gas_type",                 limit: 14
    t.integer  "staged_intervals"
    t.integer  "total_acid_used"
    t.string   "max_frac_gradient",        limit: 10
    t.integer  "recycled_water_used"
    t.integer  "total_flowback_recovered"
    t.integer  "produced_water_used"
    t.string   "flowback_disposition",     limit: 8
    t.integer  "total_proppant_used"
    t.boolean  "green_completions"
    t.string   "no_green_reasons",         limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "formation_treatments", ["completed_interval_id"], name: "index_formation_treatments_on_completed_interval_id", using: :btree
  add_index "formation_treatments", ["sidetrack_id"], name: "index_formation_treatments_on_sidetrack_id", using: :btree
  add_index "formation_treatments", ["well_id"], name: "index_formation_treatments_on_well_id", using: :btree

  create_table "formations", force: :cascade do |t|
    t.string  "code",             limit: 6
    t.string  "description",      limit: 50
    t.date    "created_at",                  default: '2015-07-30'
    t.date    "updated_at",                  default: '2015-07-30'
    t.boolean "is_not_completed",            default: false,        null: false
    t.boolean "is_other",                    default: false,        null: false
  end

  create_table "injection_facilities", force: :cascade do |t|
    t.string  "facility_type",          limit: 30
    t.string  "facility_name",          limit: 35
    t.string  "status_code",            limit: 2
    t.date    "status_date"
    t.string  "operator_name",          limit: 50
    t.integer "operator_number"
    t.string  "field_name",             limit: 30
    t.integer "field_number"
    t.float   "longitude"
    t.float   "latitude"
    t.string  "county_name",            limit: 10
    t.string  "county_api",             limit: 3
    t.string  "plss_location",          limit: 25
    t.string  "order_number",           limit: 6
    t.date    "inj_initial_date"
    t.string  "inj_fluid_type",         limit: 20
    t.string  "facility_detail_url",    limit: 70
    t.string  "related_facilities_url", limit: 35
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "injection_formations", force: :cascade do |t|
    t.integer "injection_facility_id"
    t.string  "inj_zone_name",         limit: 35
    t.string  "inj_zone_code",         limit: 5
    t.integer "inj_avg_porosity",      limit: 2
    t.integer "inj_avg_permeability",  limit: 2
    t.integer "inj_tds"
    t.float   "inj_frac_gradient"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "injection_wells", force: :cascade do |t|
    t.integer "injection_facility_id"
    t.string  "well_api_number",         limit: 12
    t.integer "well_id"
    t.string  "well_name",               limit: 35
    t.string  "facility_status",         limit: 2
    t.string  "wellbore_status",         limit: 2
    t.date    "authorization_date"
    t.date    "no_longer_injector_date"
    t.integer "max_water_inj_psi"
    t.integer "max_gas_inj_psi"
    t.integer "max_inj_volume"
    t.string  "last_mit",                limit: 35
    t.string  "well_url",                limit: 70
    t.date    "created_at"
    t.date    "updated_at"
  end

  add_index "injection_wells", ["well_id"], name: "index_injection_wells_on_well_id", using: :btree

  create_table "inspection_details", force: :cascade do |t|
    t.integer  "inspection_id"
    t.string   "api_number",                 limit: 12
    t.integer  "well_id"
    t.integer  "facility_id"
    t.string   "name",                       limit: 60
    t.string   "location",                   limit: 30
    t.float    "lat"
    t.float    "long"
    t.integer  "operator_number"
    t.string   "operator_name",              limit: 50
    t.date     "inspection_date"
    t.integer  "insp_year",                  limit: 2
    t.integer  "insp_month",                 limit: 2
    t.string   "inspector",                  limit: 50
    t.string   "inspection_was",             limit: 14
    t.string   "insp_type",                  limit: 2
    t.string   "insp_stat",                  limit: 2
    t.string   "reclamation",                limit: 1
    t.string   "p_and_a",                    limit: 1
    t.integer  "brhd_pressure"
    t.integer  "inj_pressure"
    t.integer  "t_c_ann_pressure"
    t.string   "uic_violation_type",         limit: 2
    t.boolean  "violation"
    t.boolean  "noav_sent"
    t.date     "date_corrective_action_due"
    t.date     "date_remedied"
    t.string   "pit_type",                   limit: 2
    t.boolean  "oil_on_pit"
    t.integer  "num_pits",                   limit: 2
    t.integer  "num_covered_lined",          limit: 2
    t.integer  "num_uncovered_unlined",      limit: 2
    t.string   "pit_comments",               limit: 500
    t.string   "action",                     limit: 2000
    t.string   "fencecomment",               limit: 250
    t.string   "firewall",                   limit: 750
    t.string   "genhouse",                   limit: 1250
    t.string   "historical",                 limit: 500
    t.string   "misc",                       limit: 2000
    t.string   "spilcom",                    limit: 1250
    t.string   "surfrh",                     limit: 1250
    t.string   "tankbat",                    limit: 750
    t.string   "uiccom",                     limit: 750
    t.string   "wellsign",                   limit: 250
    t.string   "workov",                     limit: 2000
    t.string   "related_facility_url",       limit: 50
    t.string   "related_docs_url",           limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inspection_details", ["api_number"], name: "index_inspection_details_on_api_number", using: :btree
  add_index "inspection_details", ["facility_id"], name: "index_inspection_details_on_facility_id", using: :btree
  add_index "inspection_details", ["insp_month"], name: "index_inspection_details_on_insp_month", using: :btree
  add_index "inspection_details", ["insp_year"], name: "index_inspection_details_on_insp_year", using: :btree
  add_index "inspection_details", ["inspection_date"], name: "index_inspection_details_on_inspection_date", using: :btree
  add_index "inspection_details", ["inspection_id"], name: "index_inspection_details_on_inspection_id", using: :btree
  add_index "inspection_details", ["well_id"], name: "index_inspection_details_on_well_id", using: :btree

  create_table "inspection_types", force: :cascade do |t|
    t.string "name",        limit: 2
    t.string "description", limit: 50
    t.date   "created_at"
    t.date   "updated_at"
  end

  create_table "inspections", force: :cascade do |t|
    t.date    "inspection_date"
    t.integer "insp_year",                 limit: 2
    t.integer "insp_month",                limit: 2
    t.integer "document_number"
    t.integer "document_id"
    t.integer "location_id"
    t.string  "api_number",                limit: 9
    t.integer "well_id"
    t.string  "inspection_type",           limit: 2
    t.string  "status_code",               limit: 2
    t.string  "overall_inspection_status", limit: 15
    t.string  "overall_ir",                limit: 4
    t.string  "overall_fr",                limit: 4
    t.string  "reclamation",               limit: 1
    t.string  "p_and_a",                   limit: 1
    t.boolean "violation"
    t.date    "created_at"
    t.date    "updated_at"
  end

  add_index "inspections", ["insp_month"], name: "index_inspections_on_insp_month", using: :btree
  add_index "inspections", ["insp_year"], name: "index_inspections_on_insp_year", using: :btree
  add_index "inspections", ["inspection_date"], name: "index_inspections_on_inspection_date", using: :btree
  add_index "inspections", ["inspection_type"], name: "index_inspections_on_inspection_type", using: :btree
  add_index "inspections", ["well_id"], name: "index_inspections_on_well_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string  "facility_name",          limit: 35
    t.string  "facility_number",        limit: 15
    t.string  "operator_name",          limit: 50
    t.integer "operator_number"
    t.string  "status_code",            limit: 2
    t.date    "status_date"
    t.string  "field_name",             limit: 20
    t.integer "field_number"
    t.string  "county_name",            limit: 10
    t.string  "county_api",             limit: 3
    t.boolean "is_denver_basin"
    t.boolean "is_piceance_basin"
    t.boolean "is_raton_basin"
    t.boolean "is_san_juan_basin"
    t.float   "longitude"
    t.float   "latitude"
    t.string  "plss",                   limit: 25
    t.integer "form_2a_doc_num"
    t.date    "form_2a_exp_date"
    t.integer "special_purpose_pits",   limit: 2
    t.integer "drilling_pits",          limit: 2
    t.integer "wells",                  limit: 2
    t.integer "production_pits",        limit: 2
    t.integer "condensate_tanks",       limit: 2
    t.integer "water_tanks",            limit: 2
    t.integer "separators",             limit: 2
    t.integer "electric_motors",        limit: 2
    t.integer "gas_or_diesel_motors",   limit: 2
    t.integer "cavity_pumps",           limit: 2
    t.integer "lact_unit",              limit: 2
    t.integer "pump_jacks",             limit: 2
    t.integer "electric_generators",    limit: 2
    t.integer "gas_pipeline",           limit: 2
    t.integer "oil_pipeline",           limit: 2
    t.integer "water_pipeline",         limit: 2
    t.integer "gas_compressors",        limit: 2
    t.integer "voc_combustor",          limit: 2
    t.integer "oil_tanks",              limit: 2
    t.integer "dehydrator_units",       limit: 2
    t.integer "multi_well_pits",        limit: 2
    t.integer "pigging_station",        limit: 2
    t.integer "flare",                  limit: 2
    t.integer "fuel_tanks",             limit: 2
    t.string  "location_details_url",   limit: 50
    t.string  "related_facilities_url", limit: 50
    t.date    "created_at"
    t.date    "updated_at"
    t.integer "status_year",            limit: 2
    t.boolean "is_dj_box",                         default: false, null: false
  end

  create_table "mechanical_integrity_tests", force: :cascade do |t|
    t.integer  "well_id"
    t.string   "well_api_number",       limit: 12
    t.string   "well_name_num",         limit: 50
    t.string   "well_status",           limit: 2
    t.integer  "document_number"
    t.string   "test_type",             limit: 24
    t.date     "test_date"
    t.integer  "test_year",             limit: 2
    t.integer  "test_month",            limit: 2
    t.integer  "facility_id"
    t.string   "facility_type",         limit: 25
    t.string   "facility_status",       limit: 2
    t.string   "operator_name",         limit: 50
    t.integer  "operator_number"
    t.string   "operator_address",      limit: 60
    t.string   "operator_contact",      limit: 30
    t.date     "date_submitted"
    t.string   "mit_assigned_by",       limit: 30
    t.date     "date_received"
    t.string   "field_rep",             limit: 30
    t.date     "approved_date"
    t.string   "approved_by",           limit: 30
    t.string   "condition_of_approval", limit: 500
    t.date     "last_approved_mit"
    t.string   "qtrqtr",                limit: 4
    t.string   "section",               limit: 2
    t.string   "township",              limit: 4
    t.string   "range",                 limit: 4
    t.string   "meridian",              limit: 1
    t.string   "formation_zones",       limit: 6
    t.string   "repair_type",           limit: 30
    t.string   "repair_description",    limit: 750
    t.string   "perforation_interval",  limit: 30
    t.string   "open_hole_interval",    limit: 30
    t.integer  "plug_depth"
    t.string   "tubing_size",           limit: 6
    t.string   "tubing_depth",          limit: 6
    t.string   "top_packer_depth",      limit: 6
    t.boolean  "multiple_packers"
    t.integer  "ten_min_case_psi"
    t.integer  "five_min_case_psi"
    t.integer  "case_before_psi"
    t.integer  "final_case_psi"
    t.integer  "final_tube_psi"
    t.integer  "initial_tube_psi"
    t.integer  "loss_gain_psi"
    t.integer  "start_case_psi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mechanical_integrity_tests", ["test_date"], name: "index_mechanical_integrity_tests_on_test_date", using: :btree
  add_index "mechanical_integrity_tests", ["test_month"], name: "index_mechanical_integrity_tests_on_test_month", using: :btree
  add_index "mechanical_integrity_tests", ["test_year"], name: "index_mechanical_integrity_tests_on_test_year", using: :btree
  add_index "mechanical_integrity_tests", ["well_api_number"], name: "index_mechanical_integrity_tests_on_well_api_number", using: :btree
  add_index "mechanical_integrity_tests", ["well_id"], name: "index_mechanical_integrity_tests_on_well_id", using: :btree
  add_index "mechanical_integrity_tests", ["well_status"], name: "index_mechanical_integrity_tests_on_well_status", using: :btree

  create_table "noavs", force: :cascade do |t|
    t.integer  "document_number"
    t.date     "violation_date"
    t.integer  "violation_year",         limit: 2
    t.integer  "violation_month",        limit: 2
    t.date     "date_received"
    t.integer  "facility_id"
    t.string   "facility_type",          limit: 30
    t.string   "well_name_number",       limit: 50
    t.string   "well_api_number",        limit: 12
    t.integer  "well_id"
    t.integer  "operator_number"
    t.string   "operator_name",          limit: 50
    t.string   "operator_address",       limit: 100
    t.string   "operator_rep",           limit: 50
    t.string   "plss_location",          limit: 30
    t.string   "county",                 limit: 10
    t.string   "cogcc_rep",              limit: 30
    t.string   "phone",                  limit: 20
    t.text     "alleged_violation"
    t.string   "cited_conditions",       limit: 1250
    t.text     "abatement"
    t.date     "abatement_date"
    t.string   "company_comments",       limit: 1000
    t.string   "company_rep",            limit: 30
    t.string   "rep_title",              limit: 30
    t.string   "rep_signature",          limit: 1
    t.date     "rep_signature_date"
    t.string   "cogcc_signature",        limit: 1
    t.date     "cogcc_signature_date"
    t.string   "resolution_approved_by", limit: 30
    t.string   "approved_by_title",      limit: 15
    t.date     "resolution_date"
    t.string   "letter_sent",            limit: 1
    t.string   "resolution_comments",    limit: 500
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "noavs", ["county"], name: "index_noavs_on_county", using: :btree
  add_index "noavs", ["violation_date"], name: "index_noavs_on_violation_date", using: :btree
  add_index "noavs", ["violation_month"], name: "index_noavs_on_violation_month", using: :btree
  add_index "noavs", ["violation_year"], name: "index_noavs_on_violation_year", using: :btree
  add_index "noavs", ["well_api_number"], name: "index_noavs_on_well_api_number", using: :btree
  add_index "noavs", ["well_id"], name: "index_noavs_on_well_id", using: :btree

  create_table "objective_formations", force: :cascade do |t|
    t.integer  "well_id"
    t.integer  "sidetrack_id"
    t.string   "formation_code", limit: 5
    t.string   "formation_name", limit: 50
    t.string   "order_detail",   limit: 10
    t.integer  "unit_acreage"
    t.string   "drill_unit",     limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objective_formations", ["formation_code"], name: "index_objective_formations_on_formation_code", using: :btree
  add_index "objective_formations", ["sidetrack_id"], name: "index_objective_formations_on_sidetrack_id", using: :btree
  add_index "objective_formations", ["well_id"], name: "index_objective_formations_on_well_id", using: :btree

  create_table "operators", force: :cascade do |t|
    t.string   "name",            limit: 50
    t.integer  "operator_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pits", force: :cascade do |t|
    t.string  "pit_name",                 limit: 35
    t.string  "pit_number",               limit: 15
    t.string  "status_code",              limit: 2
    t.string  "operator_name",            limit: 50
    t.integer "operator_number"
    t.string  "field_name",               limit: 30
    t.integer "field_code"
    t.float   "longitude"
    t.float   "latitude"
    t.float   "utm_x"
    t.float   "utm_y"
    t.string  "county_name",              limit: 10
    t.string  "api_county",               limit: 3
    t.boolean "sensitive_area"
    t.string  "land_use",                 limit: 13
    t.integer "depth"
    t.integer "length"
    t.integer "width"
    t.integer "capacity"
    t.float   "daily_disposal_evap_rate"
    t.float   "daily_disposal_perc_rate"
    t.string  "pit_type",                 limit: 14
    t.string  "liner_material",           limit: 30
    t.float   "liner_thickness"
    t.string  "treatment_method",         limit: 30
    t.boolean "covering_fence"
    t.boolean "covering_net"
    t.text    "comment"
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "planned_casings", force: :cascade do |t|
    t.integer  "well_id"
    t.integer  "sidetrack_id"
    t.string   "casing_string_type",  limit: 10
    t.string   "casing_hole_size",    limit: 8
    t.string   "casing_size",         limit: 8
    t.integer  "casing_top"
    t.integer  "casing_depth"
    t.string   "casing_weight",       limit: 10
    t.integer  "cement_sacks"
    t.integer  "cement_top"
    t.integer  "cement_bottom"
    t.string   "cement_method_grade", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "planned_casings", ["sidetrack_id"], name: "index_planned_casings_on_sidetrack_id", using: :btree
  add_index "planned_casings", ["well_id"], name: "index_planned_casings_on_well_id", using: :btree

  create_table "productions", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "report_year",         limit: 2
    t.integer "report_month",        limit: 2
    t.integer "well_id"
    t.string  "api_number",          limit: 12
    t.string  "sidetrack_num",       limit: 2
    t.string  "api_county",          limit: 3
    t.string  "formation_code",      limit: 6
    t.string  "formation_name",      limit: 50
    t.string  "well_status",         limit: 2
    t.integer "days_producing"
    t.integer "oil_bom"
    t.integer "oil_prod"
    t.integer "oil_sold"
    t.integer "oil_adj"
    t.integer "oil_eom"
    t.float   "oil_gravity"
    t.integer "gas_produced"
    t.integer "gas_flared"
    t.integer "gas_used"
    t.integer "gas_shrinkage"
    t.integer "gas_sold"
    t.integer "gas_btu"
    t.integer "gas_press_tbg"
    t.integer "gas_press_csg"
    t.integer "water_production"
    t.string  "water_disposal_code", limit: 1
    t.integer "water_press_tbg"
    t.integer "water_press_csg"
    t.integer "operator_number"
    t.string  "operator_name",       limit: 50
    t.string  "facility_name",       limit: 35
    t.string  "facility_number",     limit: 15
    t.date    "accepted_date"
    t.boolean "revised"
    t.date    "created_at"
    t.date    "updated_at"
    t.boolean "is_dj_box",                      default: false, null: false
    t.boolean "is_denver_basin",                default: false, null: false
  end

  add_index "productions", ["well_id"], name: "index_productions_on_well_id", using: :btree

  create_table "remediation_media_counts", force: :cascade do |t|
    t.string  "media",            limit: 15
    t.integer "occurrence_count", limit: 2
  end

  create_table "remediation_media_details", force: :cascade do |t|
    t.integer  "remediation_id"
    t.string   "media",          limit: 13
    t.boolean  "impacted"
    t.string   "extent",         limit: 100
    t.string   "how_determined", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remediation_media_details", ["remediation_id"], name: "index_remediation_media_details_on_remediation_id", using: :btree

  create_table "remediations", force: :cascade do |t|
    t.date     "submit_date"
    t.integer  "submit_year",           limit: 2
    t.integer  "submit_month",          limit: 2
    t.integer  "document_number"
    t.integer  "project_number"
    t.string   "report_reason",         limit: 10
    t.string   "condition_cause",       limit: 30
    t.string   "media",                 limit: 50
    t.boolean  "media_impacted"
    t.string   "media_extent",          limit: 100
    t.string   "media_how_determined",  limit: 100
    t.integer  "well_id"
    t.string   "api_number",            limit: 12
    t.string   "county_name",           limit: 10
    t.integer  "facility_id"
    t.string   "facility_type",         limit: 30
    t.string   "facility_name",         limit: 35
    t.string   "operator_name",         limit: 50
    t.integer  "operator_number"
    t.string   "operator_address",      limit: 100
    t.string   "operator_contact",      limit: 50
    t.date     "received_date"
    t.string   "assigned_by",           limit: 100
    t.string   "qtr_qtr",               limit: 6
    t.string   "section",               limit: 2
    t.string   "township",              limit: 5
    t.string   "range",                 limit: 7
    t.string   "meridian",              limit: 1
    t.string   "potential_receptors",   limit: 100
    t.text     "initial_action"
    t.text     "source_removed"
    t.text     "how_remediate"
    t.text     "monitoring_plan"
    t.text     "reclamation_plan"
    t.text     "approval_conditions"
    t.string   "document_url",          limit: 50
    t.string   "related_documents_url", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remediations", ["api_number"], name: "index_remediations_on_api_number", using: :btree
  add_index "remediations", ["county_name"], name: "index_remediations_on_county_name", using: :btree
  add_index "remediations", ["submit_date"], name: "index_remediations_on_submit_date", using: :btree
  add_index "remediations", ["submit_month"], name: "index_remediations_on_submit_month", using: :btree
  add_index "remediations", ["submit_year"], name: "index_remediations_on_submit_year", using: :btree
  add_index "remediations", ["well_id"], name: "index_remediations_on_well_id", using: :btree

# Could not dump table "shale_gas_basins" because of following StandardError
#   Unknown type 'geometry(MultiPolygon,4269)' for column 'geom_4269'

  create_table "sidetrack_status_codes", force: :cascade do |t|
    t.string   "code",        limit: 2
    t.string   "name",        limit: 30
    t.string   "description", limit: 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sidetracks", force: :cascade do |t|
    t.integer  "well_id"
    t.string   "sidetrack_number",           limit: 2
    t.string   "status_code",                limit: 2
    t.date     "status_date"
    t.date     "spud_date"
    t.string   "spud_date_type",             limit: 10
    t.string   "wellbore_permit",            limit: 11
    t.date     "completion_date"
    t.string   "log_types",                  limit: 800
    t.integer  "measured_td"
    t.integer  "measured_pb_depth"
    t.integer  "true_vertical_td"
    t.integer  "true_vertical_pb_depth"
    t.string   "permit_number",              limit: 10
    t.date     "permit_expiration_date"
    t.integer  "prop_depth_form"
    t.string   "surface_mineral_owner_same", limit: 3
    t.string   "mineral_owner",              limit: 7
    t.string   "surface_owner",              limit: 7
    t.string   "unit",                       limit: 31
    t.string   "unit_number",                limit: 14
    t.string   "top_pz_location",            limit: 30
    t.string   "footage",                    limit: 30
    t.string   "bottom_hole_location",       limit: 30
    t.string   "footages",                   limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_directional",                         default: false, null: false
    t.boolean  "is_horizontal",                          default: false, null: false
    t.boolean  "is_vertical",                            default: false, null: false
    t.boolean  "is_drifted",                             default: false, null: false
    t.boolean  "is_fracked",                             default: false, null: false
    t.boolean  "is_denver_basin",                        default: false, null: false
    t.boolean  "has_treatments",                         default: false, null: false
  end

  add_index "sidetracks", ["status_code"], name: "index_sidetracks_on_status_code", using: :btree
  add_index "sidetracks", ["well_id"], name: "index_sidetracks_on_well_id", using: :btree
  add_index "sidetracks", ["wellbore_permit"], name: "index_sidetracks_on_wellbore_permit", using: :btree

  create_table "spatial_ref_sys", primary_key: "srid", force: :cascade do |t|
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "spill_releases", id: false, force: :cascade do |t|
    t.integer  "id"
    t.date     "submit_date"
    t.integer  "submit_year",               limit: 2
    t.integer  "submit_month",              limit: 2
    t.integer  "document_number"
    t.string   "document_url",              limit: 60
    t.integer  "well_id"
    t.string   "api_number",                limit: 12
    t.string   "well_name_no",              limit: 60
    t.string   "county_name",               limit: 10
    t.string   "county_fips",               limit: 3
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "facility_id"
    t.string   "facility_type",             limit: 30
    t.string   "facility_status",           limit: 2
    t.date     "status_date"
    t.integer  "operator_number"
    t.string   "operator_name",             limit: 50
    t.string   "operator_address",          limit: 150
    t.string   "operator_phone",            limit: 20
    t.string   "operator_fax",              limit: 30
    t.string   "operator_contact",          limit: 50
    t.string   "location",                  limit: 30
    t.string   "qtr_qtr",                   limit: 6
    t.string   "section",                   limit: 2
    t.string   "township",                  limit: 5
    t.string   "range",                     limit: 5
    t.string   "meridian",                  limit: 1
    t.string   "comment",                   limit: 750
    t.date     "date_received"
    t.string   "report_taken_by",           limit: 30
    t.date     "incident_date"
    t.boolean  "ground_water"
    t.boolean  "surface_water"
    t.boolean  "berm_contained"
    t.integer  "spill_area"
    t.integer  "oil_spilled"
    t.integer  "oil_recovered"
    t.integer  "water_spilled"
    t.integer  "water_recovered"
    t.integer  "other_spilled"
    t.integer  "other_recovered"
    t.string   "current_land_use",          limit: 50
    t.string   "weather_conditions",        limit: 35
    t.string   "soil_geology_description",  limit: 750
    t.integer  "distance_to_surface_water"
    t.integer  "depth_to_ground_water"
    t.integer  "wetlands"
    t.integer  "buildings"
    t.integer  "livestock"
    t.integer  "water_wells"
    t.text     "spill_cause"
    t.string   "immediate_response",        limit: 1500
    t.string   "emergency_pits",            limit: 500
    t.text     "extent_determination"
    t.string   "further_remediation",       limit: 1500
    t.string   "problem_prevention",        limit: 1500
    t.text     "detailed_description"
    t.text     "additional_details"
    t.date     "resolution_date"
    t.boolean  "case_closed"
    t.boolean  "letter_sent"
    t.string   "cogcc_person",              limit: 30
    t.text     "final_resolution"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "well_directional_bottomholes", force: :cascade do |t|
    t.integer  "well_id"
    t.string   "bh_status",  limit: 10
    t.decimal  "mdepth",                precision: 10
    t.float    "tvd"
    t.float    "long_nad83"
    t.float    "lat_nad83"
    t.float    "utmx_z13"
    t.float    "utmy_z13"
    t.string   "deviation",  limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "well_directional_bottomholes", ["bh_status"], name: "index_well_directional_bottomholes_on_bh_status", using: :btree
  add_index "well_directional_bottomholes", ["well_id"], name: "index_well_directional_bottomholes_on_well_id", using: :btree

  create_table "well_document_counts", force: :cascade do |t|
    t.integer "document_count"
    t.string  "document_name",  limit: 65
  end

  create_table "well_documents", force: :cascade do |t|
    t.integer  "well_id"
    t.string   "well_link_id",    limit: 8
    t.integer  "document_id"
    t.integer  "document_number"
    t.string   "document_name",   limit: 65
    t.date     "document_date"
    t.integer  "document_year",   limit: 2
    t.integer  "document_month",  limit: 2
    t.string   "well_api_number", limit: 12
    t.string   "well_api_county", limit: 3
    t.string   "download_url",    limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "well_status_codes", force: :cascade do |t|
    t.string   "code",        limit: 2
    t.string   "name",        limit: 30
    t.string   "description", limit: 250
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "wells" because of following StandardError
#   Unknown type 'geometry(Point,26913)' for column 'geom_26913'

end
