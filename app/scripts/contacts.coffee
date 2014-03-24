$ ->
  contactgrid = (hex) ->
    elem = document.getElementById("contact-grid")
    grid = hex.grid(elem, { type: "businesscanvas" })
    size = hex.size(grid.elem)

    log.error(hex)
    hex.removeEvent(elem, "mousewheel", hex.mousewheel);
    hex.removeEvent(elem, "DOMMouseScroll", hex.mousewheel);

    grid.reorient(size.x * 0.5, size.y * 0.5)

    add = (x, y, name, text) ->
      pos = grid.screenpos(x, y);
      cell = $('<div>').addClass('cell').addClass(name)
      cell.css('left', pos.x + "px")
      cell.css('top', pos.y + "px")

      if text?
        cell.html(text)

      grid.root.appendChild(cell[0])

    add(-3, 1, "location", "Netherlands")
    add(-4, 1, "contact")
    add(-3, 0, "sergej")
    add(-2, 0, "job")
    add(-2, 1, "andre")
    add(-3, 2, "hung")
    add(-4, 2, "indranil")

    add(1, -2, "location", "Romania")
    add(1, -3, "contact")
    add(3, -4, "andreea")
    add(2, -4, "marian")
    add(1, -4, "adi")
    add(0, -3, "daniel")
    add(0, -2, "teodora")
    add(2, -2, "marius")
    add(2, -3, "raluca")

    add(0, 3, "location", "Germany")
    add(1, 3, "contact")
    add(0, 2, "michael")

    add(2, 0, "location", "India")
    add(3, 0, "contact")



  contactgrid(window.hex)



