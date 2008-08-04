
class Producer < ActiveRecord::Base
  include ImageHelpers
  
  has_many :answers
  has_one :image, :as => :section
  
  validates_presence_of :name, :summary, :email, :tel, :address
  validates_uniqueness_of :name
  validates_associated :answers, :image
  validates_format_of :email, :with => /[\w\-\.]+@[\w\-]+\.[a-z\.]{2,6}/
  validates_format_of :website, :with => /www\.\w+\.[\w\.]{2,6}/
  validates_length_of :summary, :in => 20..100
  validates_length_of :name, :in => 3..50

  def Producer.get(num)
    Producer.find(:all, :limit => num)
  end

  def create_default_answers
    Question.find(:all).each do |q|
      self.answers << Answer.new(:producer_id => self.id,
                                     :question_id => q.id)
    end
  end

  def create_answers(answers)
    answers.each {|ans| self.answers << Answer.new(ans) }
  end

  def update_answers(answers)
    answers.each do |key,value| 
      answer =  self.answers.find(key)
      answer.attributes = value 
      answer.save!
    end
  end
end
