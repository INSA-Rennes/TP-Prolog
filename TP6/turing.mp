

def ceil(expr x, y, w, txt, head) =
  path p;  
  p := (x, y) -- (x+w, y) -- (x+w, y+w) -- (x, y+w) -- cycle;
  if head:
    fill p withcolor .5[red,white];
  fi;
  draw p withpen pencircle scaled 1bp;
  label(txt, (x+w/2, y+w/2));
enddef;
def tape(expr x, y, w, state, txt, head) =
  label(state, (x + w/4, y + w + w/4));
  for i = 0 upto length(txt) - 1:
    ceil(x+i*w, y, w, (substring (i, i+1) of txt), (i = head));
  endfor
enddef;