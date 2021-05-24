module Admin::ArticlesHelper
  def bootstrap_alert(message, type = 'info')
    alert_class = case type
                  when 'notice'
                    'warning'
                  when /error|alert/
                    'danger'
                  else
                    'info'
                  end
    render partial: 'admin/shared/flash',
           locals: { type: type,
                     alert_class: alert_class,
                     message: message }
  end

  def flash_message(resource: nil)
    return nil if flash.empty? && !resource

    type, message = if flash.any?
                      flash.first
                    elsif resource.errors.any?
                      ['error', resource.errors.full_messages.first]
                    else
                      [nil, nil]
                    end
    return nil unless message

    bootstrap_alert(message, type)
  end
end
