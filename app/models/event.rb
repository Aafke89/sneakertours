class Event < ActiveRecord::Base


  # relations

  belongs_to :location


  mount_uploader :image, ImageUploader


  # validations
  validates :title, presence: true, length: {minimum: 3, maximum: 22}
  validates :description, presence: true, length: {minimum: 30}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :email, presence: true
  validates_format_of :link, with: /\A#{URI::regexp}\z/, :message => "Please fill in a correct adress including http:// of https://"
  validates_format_of :image, with: /\A#{URI::regexp}\z/,
    :message => "Please upload a correct image",
    :allow_blank => true
  validates_format_of :email, with: /@/

  validate :validate_start_date
  validate :validate_end_date

  ## custom validations
  def validate_start_date
    if end_date < Time.now
        errors.add(:end_date, "Event should be in the future")
    end
  end

   def validate_end_date
    if end_date < start_date
        errors.add(:end_date, "The end of the event has to be after the start of the event")
    end
  end

  # instance methods

  def always_image
    # Show the image of the location if no event-image is set.
    if self.image.blank?
      return self.location.picture
    else
      return self.image
    end
  end




end
