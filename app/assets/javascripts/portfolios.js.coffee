jQuery ->
  $('.portfolio').gpGallery('a')
  $(window).on 'ajaxComplete', ->
    $('.portfolio').gpGallery('a')