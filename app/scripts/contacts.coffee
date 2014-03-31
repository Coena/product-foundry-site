$ ->
  contactgrid = (hex) ->
    elem = document.getElementById("contact-grid")

    # Really ugly way to prevent mouse wheel events
    hex.oldAddEvent = hex.addEvent
    hex.addEvent = (elem, type, handler) ->
      if (type != "mousewheel" && type != "DOMMouseScroll")
        hex.oldAddEvent(elem, type, handler)

    grid = hex.grid(elem, { type: "businesscanvas" })
    size = hex.size(grid.elem)


    hex.removeEvent(elem, "mousewheel", hex.mousewheel);
    hex.removeEvent(elem, "DOMMouseScroll", hex.mousewheel);

    grid.reorient(size.x * 0.5, size.y * 0.5)

    offsetX = -1
    offsetY = 1

    add = (x, y, name, text) ->
      x = x + offsetX
      y = y + offsetY

      pos = grid.screenpos(x, y);
      cell = $('<div>').addClass('cell').addClass(name)
      cell.css('left', pos.x + "px")
      cell.css('top', pos.y + "px")

      if text?
        cell.html(text)

      grid.root.appendChild(cell[0])

    add(-1, 1, "location", "Netherlands")
    add(-2, 1, "contact")
    add(-1, 0, "sergej")
    add(0, 0, "job")
    add(0, 1, "andre")
    add(-1, 2, "hung")
    add(-2, 2, "indranil")
    add(-3, 2, "olaf")

    add(2, -2, "location", "Romania")
    add(2, -3, "contact")
    add(4, -4, "andreea")
    add(3, -4, "marian")
    add(2, -4, "adi")
    add(1, -3, "daniel")
    add(1, -2, "teodora")
    add(3, -2, "marius")
    add(3, -3, "raluca")

    add(1, 3, "location", "Germany")
    add(0, 3, "contact")
    add(1, 2, "michael")

    add(3, 0, "location", "India")
    add(3, 1, "contact")
    add(2, 0, "piu")
    add(4, -1, "aruna")



  contactgrid(hex.extend(window.hex,
    mouseover = () ->
  ))



