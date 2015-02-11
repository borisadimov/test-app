
emailRegEx = new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)

emptyRegEx = new RegExp(/^\s*\S.*$/)


addErrorStyle = (element) ->
  $(element).parent().addClass('invalid')
  $(element).parent().removeClass('valid')

removeErrorStyle = (element) ->
  $(element).parent().removeClass('invalid')
  $(element).parent().addClass('valid')


validateInputs = (inputs, regex) ->
  error = []
  for input in inputs
    if $(input).attr("name") is "email"
      if emailRegEx.test($(input).val())
        removeErrorStyle(input)
      else
        error.push($(input).attr("name"))
        addErrorStyle(input)
    else
      if regex.test($(input).val())
        removeErrorStyle(input)
      else
        error.push($(input).attr("name"))
        addErrorStyle(input)
  return error

errors = null



second_step = ->
  $(".first_step").fadeOut 500, ->
    $(".second_step").fadeIn()


$(document).ready ->



  $(".show_menu").click ->
    $(".mobile_menu").slideToggle()
  $(".signup, .close, .plus").click ->
    $(".header").toggleClass("dropped")



  $("input[name=name]").on 'blur', ->
    errors = validateInputs($(this), emptyRegEx)
  $("input[name=password]").on 'blur', ->
    errors = validateInputs($(this), emptyRegEx)
  $("input[name=email]").on 'blur', ->
    errors = validateInputs($(this), emailRegEx)



  $(".signup_button").click (event) ->
    event.preventDefault()
    errors = validateInputs($(".sign_up_form input"), emptyRegEx)

    if errors.length is 0
      do second_step


  $(".appname").on "keyup", ->

    if $(this).val()
      $("h3.app_name").text($(this).val())
    else
      $("h3.app_name").text("Your app name")


  $(".get_started").click (event) ->
    event.preventDefault()
    errors = validateInputs($(".name_app input"), emptyRegEx)
    if errors.length is 0
      $(".circle").css("left", "36px")
      setTimeout( ->
        window.location.href = "/"
      , 3000)



