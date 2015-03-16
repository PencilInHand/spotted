module ApplicationHelper
  def side_bar &block
    content_for(:side_bar, &block)
  end

  def page_title &block
    content_for(:title, &block)
  end
end
