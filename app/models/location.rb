class Location < ActiveRecord::Base

  # relations
  has_many :events, dependent: :destroy

  mount_uploader :picture, ImageUploader


  #validations
  validates :name, length: {minimum: 2, maximum: 30}, uniqueness: true, :presence => {message: "blaat"}
  validates :description, length: {minimum: 50}, :presence => {message: "descriptive error"}
  validates :address, :presence => {message: "rainbowpoo"}
  validates :category, :presence => {message: "unicorn"}
  validates :latitude, :presence  => {message: "Please fill in a correct streetadress"}
  validates :longitude, :presence  => {message: "Please fill in a correct streetadress"}
  validates :email, presence: true, :presence => {message: "foofofofo"}


  validates_format_of :link, with: /\A#{URI::regexp}\z/, :message => "Please fill in a correct adress including http:// of https://"
  validates_format_of :picture, with: /\A#{URI::regexp}\z/,:message => "upload a correct image", :allow_blank => true
  validates_format_of :email, with: /@/

  geocoded_by :address
  before_validation :geocode, if: :address_changed?

end
