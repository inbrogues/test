module ApplicationHelper
	def is_active_controller(controller_name, class_name = nil)
        if params[:controller] == controller_name
         class_name == nil ? "active" : class_name
        else
           nil
        end
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end

    def get_controller
        params[:controller].slice(0..((params[:controller].index('/')||0)-1))
    end

end
