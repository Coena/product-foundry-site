$ ->
  hex = window.hex
  elem = document.getElementById("contact-grid")
  grid = hex.grid(elem)
  size = hex.size(grid.elem)
  grid.reorient(size.x * 0.5, size.y * 0.5)

