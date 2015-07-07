$ ()->
  if $("table").length # Only run on pages with tables
    
    # Saved references to JQuery elements
    tableBody = $("tbody")
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
    
    # Respond to clicks on the table column headers
    $("thead td").click (e)->
      header = e.currentTarget
      columnIndex = $(header).index()
      
      # Flip the sort order if the same colum is clicked twice in a row
      sortOrder = if lastHeaderClicked is header then -sortOrder else 1
      
      # Some columns want to be sorted in reverse
      reverse = if header.hasAttribute("sort-reverse") then -1 else 1
      
      lastHeaderClicked = header
      
      tableRows.sort (rowA, rowB)->
        cellA = getCellValue(rowA, columnIndex)
        cellB = getCellValue(rowB, columnIndex)
        switch
          when cellA is "" and cellB is "" then 0
          when cellA is "" then sortOrder # Empty cells always come last, even if the column is reverse-sorted
          when cellB is "" then -sortOrder
          when cellA > cellB then sortOrder * reverse
          when cellA < cellB then -sortOrder * reverse
          else 0
      
      # Pull all the rows out of the DOM, and re-insert them — this applies the sort.
      tableRows.detach().appendTo(tableBody)
