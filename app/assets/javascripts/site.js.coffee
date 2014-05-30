jQuery ->
  $('#profilePage a.edit_info').click ->
    if $(@).parent().children('input').length
      !$($(@).parent().children('input')).removeClass('hidden')
      $($(@).parent().children('input')).focus()
    else if $(@).parent().children('textarea').length
      !$($(@).parent().children('textarea')).removeClass('hidden')
      $($(@).parent().children('textarea')).focus()
    else
      !$($(@).parent().children('select')).removeClass('hidden')
      $($(@).parent().children('select')).focus()
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
  $('#profilePage select').blur ->
    if @.value != $(@).parent().children('span').html()
      $('.edit_user').submit()
    $(@).addClass('hidden')
    $(@).parent().children('span').html($(@).find(':selected').text())

  $(window).on 'ajaxComplete', ->
    $('.portfolio_image').gpGallery('a')
    $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', slideshow: 10000, autoplay_slideshow: false, deeplinking:false})
  $('.portfolio_image').gpGallery('a')
  $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', slideshow: 10000, autoplay_slideshow: false, deeplinking:false})