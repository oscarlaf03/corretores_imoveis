module ApplicationHelper
  require_relative 'path_helper'


  def owner?
    user_signed_in? && current_user.site_owner
  end

  def company
    Company.all.first
  end

  def first_image(asset)
    asset.photos.any? ? (cl_image_path asset.photos.first.image) : 'https://kitt.lewagon.com/placeholder/cities/tokyo'
  end

  def last_image(asset)
    asset.photos.any? ? (cl_image_path asset.photos.last.image) : 'https://kitt.lewagon.com/placeholder/cities/sao-paulo'
  end

  def capa(company)
    company.banner.present? ? (cl_image_path company.banner) : 'https://kitt.lewagon.com/placeholder/cities/shanghai'
  end

end
