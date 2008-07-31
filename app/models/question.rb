class Question < ActiveRecord::Base
  has_many :answers

  def to_sym
    name.split[0].downcase.to_sym
  end
end
