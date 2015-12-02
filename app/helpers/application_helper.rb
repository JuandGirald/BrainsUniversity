module ApplicationHelper

	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "BrainsUniversity"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def youtube_embed(youtube_url)
  	if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end

	  iframe = %Q{<iframe title='YouTube video player' width='640' height='480' src='http://www.youtube.com/embed/#{ youtube_id }' frameborder='0' allowfullscreen></iframe>}
		iframe.html_safe
	end
  
end
