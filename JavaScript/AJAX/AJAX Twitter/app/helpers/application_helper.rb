module ApplicationHelper

  def nice_date(date, type = "num")
    case type
    when "text"
      date.strftime("%l:%M%P on %B %e, %Y")
    else
      date.strftime("%l:%M%P on %m/%d/%Y")
    end
  end

end
