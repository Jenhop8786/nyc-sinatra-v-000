class Title < ActiveRecord::Base

  has_many :figure_titles
  has_many :figures 

end#Title
