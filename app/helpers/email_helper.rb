module EmailHelper
  def email_image_tag(image, image_binary, **options)
    attachments.inline[image] = {
        :data => image_binary,
        :mime_type => "application/x-gzip"
    }
    image_tag attachments[image].url, **options
  end
end