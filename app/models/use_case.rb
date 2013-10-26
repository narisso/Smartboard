class UseCase < ActiveRecord::Base
  attr_accessible :name, :project_id, :use_case_template_id, :data, :use_case_group_id

  belongs_to :project
  belongs_to :use_case_template
  belongs_to :use_case_group
  has_many :requirements

  validates :name, presence: true
  validates :project_id, presence: true
  validates :use_case_template_id, presence: true

  def parse_data
  	template = JSON.parse(self.use_case_template.template_form)
  	values = JSON.parse(self.data)
  	parse = Hash.new

  	template.each do |attribute|
  		parse[attribute[1]["name"]] = values[attribute[0]]
  	end
  	return parse
  end
end
