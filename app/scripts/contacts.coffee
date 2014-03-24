$ ->
  contactgrid = (hex) ->
    elem = document.getElementById("contact-grid")
    grid = hex.grid(elem, { type: "businesscanvas" })
    size = hex.size(grid.elem)
    grid.reorient(size.x * 0.5, size.y * 0.5)

    add = (x, y, name) ->
      pos = grid.screenpos(x, y);
      cell = $('<div>').addClass('cell').addClass(name)
      cell.css('left', pos.x + "px")
      cell.css('top', pos.y + "px")
      grid.root.appendChild(cell[0])

    add(-3, 0, "sergej")
    add(-2, 0, "job")
    add(-2, 1, "andre")
    add(-3, 2, "hung")
    add(-4, 2, "indranil")

    add(3, -4, "andreea")
    add(2, -4, "marian")
    add(1, -4, "adi")
    add(0, -3, "daniel")
    add(0, -2, "teodora")
    add(2, -2, "marius")
    add(3, -3, "raluca")

    add(0, 2, "michael")


  contactgrid(window.hex)



