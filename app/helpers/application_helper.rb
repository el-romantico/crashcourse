module ApplicationHelper

  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files, 'data-turbolinks-track' => true ) }
  end

end
