class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags,:allow_destroy =>:true,:reject_if=>proc{|attrs|attrs.all?{|k,v|v.blank?}}
end
