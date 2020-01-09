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

    def asset_exists?(subdirectory, filename)
      File.exists?(File.join(Rails.root, 'app', 'assets', subdirectory, filename))
    end

    def image_exists?(image)
      asset_exists?('images', image)
    end

    def javascript_exists?(script)
      extensions = %w(.coffee .erb .coffee.erb) + [""]
      extensions.inject(false) do |truth, extension|
        truth || asset_exists?('javascripts', "#{script}.js#{extension}")
      end
    end

    def stylesheet_exists?(stylesheet)
      extensions = %w(.scss .erb .scss.erb) + [""]
      extensions.inject(false) do |truth, extension|
        truth || asset_exists?('stylesheets', "#{stylesheet}.css#{extension}")
      end
    end

end
