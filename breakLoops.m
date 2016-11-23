function newRoute = breakLoops(route)

newRoute = route;

n = length(route);
visited = ones(1, n);
allZeros = false;

for i = 1:n 
  if (newRoute(i) == 0)
    visited(i) = 2;
  endif
  if (newRoute(i) == i)
    newRoute(i) = 0;
    visited(i) = 2;
  endif
endfor

for i = 1:n 
  if (visited(i) != 2)
    loop = true;
  endif
endfor

if (loop)

  do 
    currentNode = ceil(rand() * n);
  until (visited(currentNode) == 1)
  currentPointer = newRoute(currentNode);
  do
    endLoop = true;
    if (visited(currentPointer) == 0)
      newRoute(currentNode) = 0;
      visited(currentNode) = 2;
      for i = 1:n 
        if (visited(i) == 0)
          visited(i) = 2;
        endif
      endfor
      for i = 1:n 
        if (visited(i) != 2)
          endLoop = false;
        endif
      endfor
      if (endLoop)
        break;
      endif
      do 
        currentNode = ceil(rand() * n);
      until (visited(currentNode) == 1)
      currentPointer = newRoute(currentNode);
    elseif (visited(currentPointer) == 1)
      visited(currentNode) = 0;
      currentNode = currentPointer;
      currentPointer = newRoute(currentNode);
      endLoop = false;
    else
      visited(currentNode) = 2;
      for i = 1:n 
        if (visited(i) == 0)
          visited(i) = 2;
        endif
      endfor
      for i = 1:n 
        if (visited(i) != 2)
          endLoop = false;
        endif
      endfor
      if (endLoop)
        break;
      endif
      do 
        currentNode = ceil(rand() * n);
      until (visited(currentNode) == 1)
      currentPointer = newRoute(currentNode);
    endif
  until(endLoop)
  
endif
