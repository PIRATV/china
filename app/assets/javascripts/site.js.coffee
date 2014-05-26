jQuery ->
  $('#profilePage a.edit_info').click ->
    if $(@).parent().children('input').length
      !$($(@).parent().children('input')).removeClass('hidden')
      $($(@).parent().children('input')).focus()
    else
      !$($(@).parent().children('textarea')).removeClass('hidden')
      $($(@).parent().children('textarea')).focus()
    return false
  $('#profilePage input').blur ->
    if @.value != $(@).parent().children('span').html().trim()
      $('.edit_user').submit()
    $(@).addClass('hidden')
    $(@).parent().children('span').html(@.value)
  $('#profilePage textarea').blur ->
    if @.value != $(@).parent().children('span').html()
      $('.edit_user').submit()
    $(@).addClass('hidden')
    $(@).parent().children('span').html(@.value)

  $(window).on 'ajaxComplete', ->
    $('.portfolio_image').gpGallery('a')
    $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', slideshow: 10000, autoplay_slideshow: false, deeplinking:false})
  $('.portfolio_image').gpGallery('a')
  $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', slideshow: 10000, autoplay_slideshow: false, deeplinking:false})