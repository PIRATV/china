jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  if($("#license").length)
    $("#btn").attr('type', 'button')
  $("#license span").click ->
    input = $("#license input")[0]
    input.checked = !input.checked
    if input.checked
      $("#btn").removeClass 'inactive'
      $("#btn").attr('type', 'submit')
    else
      $("#btn").addClass 'inactive'
      $("#btn").attr('type', 'button')

  $("#license input").click ->
    if @.checked
      $("#btn").removeClass 'inactive'
      $("#btn").attr('type', 'submit')
    else
      $("#btn").addClass 'inactive'
      $("#btn").attr('type', 'button')