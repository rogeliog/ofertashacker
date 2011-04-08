class Company < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :jobs, :dependent => :destroy
  
  validates :title, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :website, :with => /^(w{3}[.])\w+[.]\w{2,}/
  
  validates_attachment_content_type :logo, 
                                    :content_type => ['image/jpg','image/jpeg', 
                                                      'image/png', 'image/gif']
  
  attr_accessible :email, :password, :password_confirmation, 
                  :remember_me, :title, :city, :logo, :description,
                  :phone1, :phone2, :contact_email, :linkedin, :facebook, :twitter, :website

	metropoli_for :city, :as=>:city_name
  scope :members, where(:role => "member")
  
  DEFAUL_LOGO_ROUTE = "/images/shareIcon.png"

  has_attached_file :logo, :styles => {:medium => "200x100>", :thumb => "149x35>"},
                            :default_style => :thumb,
                            :storage => {
                              'development' => :filesystem,
                              'test' => :filesystem,
                              'staging' => :s3,
                              'production' => :s3
                            }[Rails.env],
                            :s3_credentials => "#{Rails.root}/config/s3.yml",
                            :url => "../files/#{ENV['RAILS_ENV']}/:attachment/:id/:style/:basename.:extension",
                            :path => "public/files/#{Rails.env}/:attachment/:id/:style/:basename.:extension",
                            :bucket => 'rubypros',
                            :default_url => DEFAUL_LOGO_ROUTE
                            
  def admin?
    self.role == "admin"
  end
  
  def member?
    self.role == "member"
  end
  
  def logo_url
    self.logo.path.nil? ?  DEFAUL_LOGO_ROUTE : self.logo.path[6..-1]
  end
 
  def facebook?
    !self.facebook.blank?
  end

  def website?
    !self.website.blank?
  end

  def twitter?
    !self.twitter.blank?
  end
  def contact_email?
    !self.contact_email.blank?
  end
  
  def phone1?
    !self.phone1.blank?
  end

end

