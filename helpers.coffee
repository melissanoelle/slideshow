# keeping this for god-knows why.
###
getElementsByClass = (searchClass, node, tag) ->
  console.log "entering getElementsByClassName(#{searchClass}, #{node}, #{tag})"
  unless node? then node = 'document'
  unless tag? then tag = '*'
  elems = document.getElementsByTagName("*") # hardcoding in document and the asterisk for now
  classElements = null
  console.log "about to run through elems for class name #{searchClass} which have a found length of #{elems.length}"
  for elem of elems # CS will automatically return the results of this array
    console.log "this is an elem, the class name is #{elem.className} the elem is: #{elem.class}"
    if elem.className?
      if elem.className.search(searchClass)
        classElements[_i] = elem
  return classElements
###

