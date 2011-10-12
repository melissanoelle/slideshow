slideCount = 0 # index of array for <section class="slide">
speakerNotesShown = helpMenuShown = controlsShown = false

load = ->
  console.log window.location.hash
  elems = getElementsByClass('slide', null, 'section')
  unless window.location.hash?
    for elem in elems
      slideCount = _i if window.location.hash.slice(1) is elem.id
  for slide in elems
    if i is slideCount
      slide.style.display = 'inline'
      slide.style.opacity = 1
    else
      slide.style.display = 'none'
      slide.style.opacity = 0

slideControl = (event) ->
  switch String.fromCharCode(event.which).toLowerCase() or event.which
    when 'n'
      speakerNotes()
    when 37
      # left arrow
      previousSlide()
    when 39
      # right arrow
      nextSlide()
    when 'h'
      helpMenu()
    when 'c'
      controlsMenu()
    else
      # do nothing

nextSlide = ->
  elems = getElementsByClass('slide', null, 'section')
  elems[slideCount].style.display = 'none'
  elems[slideCount].style.opacity = 0
  # make sure it doesn't go out of bounds
  slideCount++ if slideCount < elems.length -1
  window.history.pushState('string 1', 'title', '/slideshow/index.htm#' + elems[slideCount].id)
  elems[slideCount].style.display = 'inline'
  elems[slideCount].style.opacity = 1
  elems[slideCount].style.position = 'relative'
  elems[slideCount].style.left = '0px' # why do i have this in here in the JS again???

previousSlide = ->
  elems = getElementsByClass('slide', null, 'section')
  elems[slideCount].style.display = 'none'
  elems[slideCount].style.opacity = 0
  # make sure it doesn't go out of bounds
  slideCount-- if slideCount > 0
  window.history.pushState('string 2', 'title', '/slideshow/index.htm#' + elems[slideCount].id)
  elems[slideCount].style.display = 'inline'
  elems[slideCount].style.opacity = 1
  elems[slideCount].style.position = 'relative'
  elems[slideCount].style.left = '0px'

speakerNotes = ->
  elems = getElementsByClass('note', null, 'aside')
  if speakerNotesShown
    # change CSS so that speaker notes are hidden
    for note in elems
      note.style.display = 'none'
  else
    # change CSS so that speaker notes are shown
    for note in elems
      note.style.display = 'inline'
  speakerNotesShown = !speakerNotesShown

helpMenu = ->
  elems = getElementsByClass('help', null, 'aside')
  if helpMenuShown
    elems[0].style.display = 'none'
  else
    elems[0].style.display = 'block'
  helpMenuShown = !helpMenuShown

controlsMenu = ->
  elems = getElementsByClass('controls', null, 'aside')
  if controlsShown
    elems[0].style.display = 'none'
  else
    elems[0].style.display = 'block'
  controlsShown = !controlsShown

getElementsByClass = (searchClass, node, tag) ->
  if node == null
    node = document
  if tag == null
    tag = '*'
  elems = node.getElementsByTagName(tag)
  pattern = new RegExp("(^|\\s)" + searchClass + "(\\s|$)")
  j = 0
  for elem in elems
    if pattern.test(elem.className)
      classElements[j] = elem
      j++
  return classElements

