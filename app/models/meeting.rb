class Meeting < ActiveRecord::Base  
  # Upload
  has_attached_file :slide_preview, :styles => { :medium => "267x345>", :thumb => "116x150>" }
  
  # Scopes
  default_scope :order => 'start_on DESC'

  # Validations
  validates_presence_of :name, :description

  with_options :allow_blank => true do |m|
    m.validates_length_of :name, :in => 1..255
    m.validates_uniqueness_of :name, :scope => :user_id, :case_sensitive => false
  end

  def to_s
    name
  end
end

