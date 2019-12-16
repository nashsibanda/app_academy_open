module ApplicationHelper
  def auth_token
    "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">".html_safe
  end

  def cheers_for(cheerable_entity)
    cheers_text = (cheerable_entity.cheer_count == 1 ? "cheer" : "cheers")
    existing_cheer = cheerable_entity.cheers.where(cheerer_id: current_user.id).first
    # button = 
    
    
    if existing_cheer
      button = button_to "Uncheer!", cheer_url(existing_cheer), method: :delete
    else 
      button = button_to "Cheer!", polymorphic_url([cheerable_entity, Cheer])
    end
    return "#{cheerable_entity.cheer_count} #{cheers_text} #{button}".html_safe
  end
end
