class Location < ActiveRecord::Base

  # relations
  has_many :events, dependent: :destroy

  mount_uploader :picture, ImageUploader


  #validations
  validates :name, length: {minimum: 2, maximum: 22}, uniqueness: true, :presence => {message: "A location should have some kind of title, you know"}
  validates :description, length: {minimum: 30, maximum: 600}, :presence => {message: "Please give a description for this awesome location"}
  validates :address, :presence => {message: "How can we find this location without an adress?"}
  validates :category, :presence => {message: "We know, you don't want to categorize everything, but sometimes it can be helpful. So please MAKE A CHOICE!"}
  validates :latitude, :presence  => {message: "Please fill in a correct streetadress"}
  validates :longitude, :presence  => {message: "Please fill in a correct streetadress"}
  validates :email, presence: true, :presence => {message: "Please, tell us who you are"}


  validates_format_of :link, with: /\A#{URI::regexp}\z/, :message => "Please fill in a correct adress including http:// of https://"
  validates_format_of :picture, with: /\A#{URI::regexp}\z/,:message => "upload a correct image", :allow_blank => true
  validates_format_of :email, with: /@/

  geocoded_by :address
  before_validation :geocode, if: :address_changed?

end
