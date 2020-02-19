module ApplicationHelper
  def render_if(condition, obj)
    render obj if condition
  end
end
