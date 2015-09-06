$ ()->

  setup = (table)->
    # Saved references to JQuery elements
    tableBody = table.children("tbody")
    tableRows = tableBody.children("tr")
    
    # State
    sortOrder = 1
    lastHeaderClicked = null
    
    # Get the contents of each cell, for sorting.
    # TODO: Precompute & cache, or memoize, if performance stats to suck.
    getCellValue = (row, columnIndex)->
      cell = row.children[columnIndex]
      
      value = if cell.hasAttribute("sort-value")
        cell.getAttribute("sort-value")
      else
        $.trim(cell.textContent)
      
      if cell.hasAttribute("sort-n")
        parseInt(value)
      else
        value
    
    getSorting = (rowA, rowB, sortOrder, reverse, columnIndex, originalIndex)->
      cellA = getCellValue(rowA, columnIndex)
      cellB = getCellValue(rowB, columnIndex)
      switch
        when cellA is "" and cellB is "" then 0
        when cellA is "" then sortOrder # Empty cells always come last, even if the column is reverse-sorted
        when cellB is "" then -sortOrder
        when cellA > cellB then sortOrder * reverse
        when cellA < cellB then -sortOrder * reverse
        else
          # Bail — we've already looped around, and we're hitting duplicates
          if columnIndex+1 is originalIndex
            0
          # Can we move right without running off the end?
          else if columnIndex+1 < rowA.children.length
            getSorting(rowA, rowB, sortOrder, reverse, columnIndex+1, originalIndex)
          # Can we loop around without hitting our original index?
          else if originalIndex > 1
            getSorting(rowA, rowB, sortOrder, reverse, 1, originalIndex)
          # Bail — we're hitting duplicates
          else
            0
    
    doSort = (header)->
      lastHeaderClicked.classList.remove("active") if lastHeaderClicked?
      lastHeaderClicked.classList.remove("reversed") if lastHeaderClicked?
      header.classList.add("active")
      
      # Flip the sort order if the same colum is clicked twice in a row
      sortOrder = if lastHeaderClicked is header then -sortOrder else 1
      header.classList.add("reversed") if sortOrder < 0
      
      # Some columns want to be sorted in reverse
      reverse = if header.hasAttribute("sort-reverse") then -1 else 1
      
      lastHeaderClicked = header
      
      columnIndex = $(header).index()
      
      tableRows.sort (rowA, rowB)->
        getSorting(rowA, rowB, sortOrder, reverse, columnIndex, columnIndex)
      
      # Pull all the rows out of the DOM, and re-insert them — this applies the sort.
      tableRows.detach().appendTo(tableBody)
    
    # Respond to clicks on the table column headers
    $("thead td").click (e)-> doSort(e.currentTarget)
    
    # If there's a default sort, do it!
    defHeader = $("td[default=true]")
    if defHeader.length
      doSort(defHeader[0])


  setup(table) for table in $("table") # Only run on pages with tables
