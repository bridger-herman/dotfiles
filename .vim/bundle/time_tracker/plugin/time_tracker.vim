let g:config_file = '.time_tracker'


function! g:TimeTrackerClockIn()
  let rows = readfile(g:config_file)
  let rows = rows + [localtime()]
  if writefile(rows, g:config_file)
  endif
endfunction

function! g:TimeTrackerClockOut()
  let rows = readfile(g:config_file)
  let rows = rows + [localtime(), ""]
  if writefile(rows, g:config_file)
  endif
endfunction

function! g:TimeTrackerStatus()
  let rows = readfile(g:config_file)
  let sum = 0
  let previous_1 = 0
  let previous_2 = 0
  for row in rows
    if row == ''
      let sum += previous_1 - previous_2
      let previous_1 = 0
      let previous_2 = 0
    else
      let previous_2 = previous_1
      let previous_1 = row
    endif
  endfor
  echom 'Working for ' . sum / 60 . ' minutes and ' . sum % 60 . ' seconds'
endfunction

autocmd VimEnter * call TimeTrackerClockIn()
autocmd VimLeave * call TimeTrackerClockOut()
