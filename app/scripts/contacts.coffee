$ ->
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

    add = (x, y, name, content) ->
      x = x + offsetX
      y = y + offsetY

      pos = grid.screenpos(x, y);
      cell = $('<div>').addClass('cell').addClass(name)
      cell.css('left', pos.x + "px")
      cell.css('top', pos.y + "px")

      if name == 'contact'
        srcElem = $('#' + content)
        titleElem = $('h1', srcElem)
        contentElem = titleElem.nextAll()
        log.error(contentElem.html())
        cell.popover({ placement: 'top', trigger: 'click', title: titleElem.text(), content: contentElem.html(), html: true })
      else if name == 'location'
        cell.html(content)
      else
        cell.popover({ placement: 'top', trigger: 'hover', title: content, html: true, delay: { show: 500, hide: 0 } })

      grid.root.appendChild(cell[0])

    add(-1, 1, "location", "Netherlands")
    add(-2, 1, "contact", "netherlands")
    add(-1, 0, "sergej", "Sergej")
    add(0, 0, "job", "Job")
    add(0, 1, "andre", "Andr&eacute;")
    add(-1, 2, "hung", "Hung")
    add(-2, 2, "indranil", "Indranil")
    add(-3, 2, "olaf", "Olaf")

    add(2, -2, "location", "Romania")
    add(2, -3, "contact", "romania")
    add(4, -4, "andreea", "Andreea")
    add(3, -4, "marian", "Marian")
    add(2, -4, "adi", "Adrian")
    add(1, -3, "daniel", "Daniel")
    add(1, -2, "teodora", "Teodora")
    add(3, -2, "marius", "Marius")
    add(3, -3, "raluca", "Raluca")

    add(1, 3, "location", "Germany")
    add(0, 3, "contact", "germany")
    add(1, 2, "michael", "Michael")

    add(3, 0, "location", "India")
    add(3, 1, "contact", "india")
    add(4, 0, "piu", "Piu")
    add(4, -1, "aruna", "Aruna")
    add(2, 0, "sanjay", "Sanjay")

  $('#contact-grid').show()
  $('#contact article').hide()
  contactgrid(window.hex)



