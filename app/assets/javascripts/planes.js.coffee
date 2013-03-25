$ ->
  UPDATE_EVERY_MSEC = 3000

  $('[data-launch-all]').on 'click', ->
    $('form').submit()

  $('[data-launch-plane]').on 'ajax:success', ->
    location.reload()

  updatePercentage = (el) ->
    $.getJSON el.data('plane-path'), (data) ->
      el.find('[data-percentage]').html data.text
      if data.launched
        el.remove()
      else
        setTimeout (-> updatePercentage(el)),
          UPDATE_EVERY_MSEC

  $('[data-launching="true"]').each ->
    updatePercentage $(@)
