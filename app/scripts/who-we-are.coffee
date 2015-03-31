whowearegrid = (hex) ->
  elem = document.getElementById("who-we-are-grid")

  ignoreEvents = ['mousewheel', 'DOMMouseScroll']

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

    cell.addClass(content)
    srcElem = $('#' + content)
    if (srcElem.length == 1)
      titleElem = $('.title', srcElem)
      contentElem = $('.content', srcElem)
      trigger = 'hover'
      delay = { show: 500, hide: 100 }
      placement = if y < 0 then 'bottom' else 'top'
      cell.popover({ placement: placement, trigger: trigger, title: titleElem.html(), content: contentElem.html(), delay: delay, html: true })

    grid.root.appendChild(cell[0])

  add(5, -3, "person", "marian")
  add(3, -3, "person", "daniel")
  add(1, -3, "person", "teodora")
  add(1, -1, "person", "marius")
  add(5, -1, "person", "andreea")
  add(3, -1, "person", "raluca")
  add(-1, 1, "person", "job")
  add(-1, -1, "person", "andre")
  add(3, 1, "person", "hung")
  add(1, 1, "person", "indranil")
  add(-1, 1, "logo", "you")

$ ->
  $('#who-we-are-grid').show()
  $('#who-we-are article').hide()
  whowearegrid(window.hex)



