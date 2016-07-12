class Event < ActiveRecord::Base


  # relations

  belongs_to :location


  # validations
  validates :title, presence: true, length: {minimum: 3, maximum: 30}
  validates :description, presence: true, length: {minimum: 50}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_format_of :link, with: /\A#{URI::regexp}\z/, :message => "Please fill in a correct adress including http:// of https://"
  validates_format_of :image, with: /\A#{URI::regexp}\z/, :message => "Please fill in a correct adress including http:// of https://"

  validate :validate_start_date
  validate :validate_end_date

  ## custom validations
  def validate_start_date
    if start_date < Time.now
        errors.add(:start_date, "Event should be in the future")
    end
  end

   def validate_end_date
    if end_date < start_date
        errors.add(:end_date, "The end of the event has to be after the start of the event")
    end
  end

  # instance methods

  def always_image
    # Add some random pictures as default picture
    default_images = ["http://www.sneakertours.nl/illustrations/landingspage22.jpg",
      "http://www.sneakertours.nl/illustrations/provowittefiets.jpg",
      "http://www.sneakertours.nl/illustrations/st-map-blauw.jpg"]
    if self.image != nil && self.image != ""
      self.image
    else
      default_images.sample
    end
  end




end
