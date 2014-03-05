jQuery ->

  $(document).on "ajaxComplete", (event, xhr, settings) ->
    csrf_param = xhr.getResponseHeader 'X-CSRF-Param'
    csrf_token = xhr.getResponseHeader 'X-CSRF-Token'

    $('meta[name="csrf-param"]').attr('content', csrf_param) if csrf_param?
    $('meta[name="csrf-token"]').attr('content', csrf_token) if csrf_token?
