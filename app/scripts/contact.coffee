contactgrid = (hex) ->
  elem = document.getElementById("contact-grid")

  ignoreEvents = ['mousewheel', 'DOMMouseScroll', 'panstart', 'panmove', 'panend']

  # Really ugly way to prevent mouse wheel events
  hex.oldAddEvent = hex.addEvent
  hex.addEvent = (elem, type, handler) ->
    if (!type in ignoreEvents)
      hex.oldAddEvent(elem, type, handler)

  grid = hex.grid(elem, { type: "businesscanvas" })
  size = hex.size(grid.elem)

  centerGrid = () ->
    size = hex.size(grid.elem)
    grid.reorient(size.x * 0.5, size.y * 0.5)

  centerGrid()
  window.onresize = () -> centerGrid()

  offsetX = -1
  offsetY = 1

  add = (x, y, type, content) ->
    x = x + offsetX
    y = y + offsetY

    pos = grid.screenpos(x, y);
    cell = $('<div>').addClass('cell').addClass(type)
    cell.css('left', pos.x + "px")
    cell.css('top', pos.y + "px")
    cell.attr('rel', type + '-' + content)

    if (type == 'location')
      cell.html(content)
    else
      cell.addClass(content)
      srcElem = $('#' + content)
      if (srcElem.length == 1)
        titleElem = $('.title', srcElem)
        contentElem = $('.content', srcElem)
        trigger = if type == 'person' then 'hover' else 'click'
        delay = if trigger == 'hover' then { show: 500, hide: 100 } else { show: 0, hide: 0 }
        placement = if y < 0 then 'bottom' else 'top'
        cell.popover({ placement: placement, trigger: trigger, title: titleElem.html(), content: contentElem.html(), delay: delay, html: true })

    grid.root.appendChild(cell[0])

  add(-1, 1, "location", "Netherlands")
  add(-2, 1, "contact", "netherlands")
  add(-1, 0, "person", "sergej")
  add(0, 0, "person", "job")
  add(0, 1, "person", "andre")
  add(-1, 2, "person", "hung")
  add(-2, 2, "person", "indranil")
  add(-3, 2, "person", "olaf")

  add(2, -2, "location", "Romania")
  add(2, -3, "contact", "romania")
  add(4, -4, "person", "andreea")
  add(3, -4, "person", "marian")
  add(2, -4, "person", "adrian")
  add(1, -3, "person", "daniel")
  add(1, -2, "person", "teodora")
  add(3, -2, "person", "marius")
  add(3, -3, "person", "raluca")

  add(1, 3, "location", "Germany")
  add(0, 3, "contact", "germany")
  add(1, 2, "person", "michael")

  add(3, 0, "location", "India")
  add(3, 1, "contact", "india")
  add(4, 0, "person", "piu")
  add(4, -1, "person", "aruna")
  add(2, 0, "person", "sanjay")

$ ->
  $('#contact-grid').show()
  $('#contact article').hide()
  contactgrid(window.hex)



