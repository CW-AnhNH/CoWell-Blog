$(document).ready(function() {
    imageHandler()
    videoHandler()
  })
  function imageHandler() {
    $('#post_image_url').on('keyup', function(event) {
      if (event.keyCode == 86) {
      clearMediaPreview()    
      var imageUrl = $('#post_image_url').val()
      showImagePreview(imageUrl)
      hideVideoUrl()
    }
    if (event.keyCode == 8) {
      if ($('#post_image_url').val() == "") {
        clearMediaPreview()
        showVideoUrl()
      }
     }
   })
  }
  function videoHandler() {
    $('#post_video_url').on('keyup', function(event) {
      if (event.keyCode == 86) {
        clearMediaPreview()
        var videoUrl = $('#post_video_url').val()
        var videoId = parseVideoUrl(videoUrl)
        showVideoPreview(videoId)
        hideImageUrl()
      }
      if (event.keyCode == 8) {
        if ($('#post_video_url').val() == "") {
          clearMediaPreview()
          showImageUrl()
        }
      }
    })
  }
  function clearMediaPreview() {
    $('.media-preview').html('')
  }
  function showImagePreview(imageUrl) {
    $('.media-preview').html('<img src=' + imageUrl + '>')
  }
  function showVideoPreview(videoId) {
    $('.media-preview').html("<iframe width='560' height='315' 
     src='https://www.youtube.com/embed/" + videoId + "?
     autoplay=1&enablejsapi=1' frameborder='0' allowfullscreen>
     </iframe>") 
    }
  function showImageUrl() {
    $('#post_image_url').show()
  }
  function showVideoUrl() {
    $('#post_video_url').show()
  }
  function hideImageUrl() {
    $('#post_image_url').hide()
  }
  function hideVideoUrl() {
    $('#post_video_url').hide()
  }
  function parseVideoUrl(videoUrl) {
    var id = videoUrl.replace("https://www.youtube.com/watch?v=", "")
    return id
  }