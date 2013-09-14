module ProjectsHelper
	def get_role user, project
		entity = ProjectRoleUser.where(:user_id => user, :project_id => project).first
		entity.role.name
	end
end
