module ApplicationHelper
	def userIsCoordinator
    return current_user.id == 1
  end
end
