module ApplicationHelper
  def side_bar &block
    content_for(:side_bar, &block)
  end
end
