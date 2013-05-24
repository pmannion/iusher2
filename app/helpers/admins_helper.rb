module AdminsHelper

  def pic_for(admin,image_options={}, html_options={})
    link_to(image_tag(admin.pic.url,image_options),admin ,html_options)
  end
end
