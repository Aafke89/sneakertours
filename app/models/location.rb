class Location < ActiveRecord::Base

  # relations
  has_many :events, dependent: :destroy

  #validations
  validates :name, presence: true, length: {minimum: 2, maximum: 30}, uniqueness: true
  validates :description, presence: true, length: {minimum: 50}
  validates :address, presence: true
  validates :category, presence: true
  validates :latitude, :presence  => {message: "Please fill in a correct streetadress"}
  validates :longitude, :presence  => {message: "Please fill in a correct streetadress"}

  validates_format_of :link, with: /\A#{URI::regexp}\z/, :message => "Please fill in a correct adress including http:// of https://"
  validates_format_of :picture, with: /\A#{URI::regexp}\z/, :message => "Please fill in a correct adress including http:// of https://"






  geocoded_by :address
  before_validation :geocode, if: :address_changed?

end
