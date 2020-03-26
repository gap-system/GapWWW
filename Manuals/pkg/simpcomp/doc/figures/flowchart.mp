input TEX;

prologues:=3;

verbatimtex
%&latex
\documentclass{article}
\usepackage{latexsym,amsmath,amssymb,a4wide,amscd}
\begin{document}
etex

vardef polygon(expr sides) =
    for i = 0 upto sides - 1:
        ((1,0) rotated (360/sides * i)) --
    endfor
    cycle
enddef;

vardef triangle(expr A,B,C) =
    A--B--C--cycle
enddef;

vardef quad(expr A,x,y) =
    o shifted A--o shifted A+x--o shifted A+x+y--o shifted A+y--cycle
enddef;

vardef c(expr x,y) =
    x*bx + y*by shifted o
enddef;


vardef fracpos(expr A,B,f) =
    f[A,B]
enddef;



beginfig(1)
 
   pair L,B;
   pair o,bx,by;
   u:=1.0cm;
   bx:=u*(1,0);
   by:=u*(0,1);
   o:=u*(0,0);   
  
   % -------------------
   % -------------------
   % projective pre image 
   % -------------------
   % -------------------
   
   % shift of origin
   o:=u*(0,0);
   bx:=u*(1,0);
   by:=u*(0,1);
     
   L:=u*(5,0);
   B:=u*(0,2);
   
   draw quad(c(7,7),L,B);

   draw quad(c(10.5,4),L,B);
   draw quad(c(3.5,4),L,B);

   draw quad(c(7.5,1),L,B);
   draw quad(c(13.5,1),L,B);

   
   drawarrow c(9.5,7)--c(6,6);
   drawarrow c(9.5,7)--c(13,6);
   drawarrow c(13,4)--c(10,3);
   drawarrow c(13,4)--c(16,3);

   
  
   label.rt(btex \texttt{SCPropertyObject} etex) shifted c(7.9,8);
   
   label.rt(btex \texttt{SCLibRepository} etex) shifted c(4.5,5);
   label.rt(btex \texttt{SCPolyhedralComplex} etex) shifted c(11.2,5);

   label.rt(btex \texttt{SCNormalSurface} etex) shifted c(8.5,2);
   label.rt(btex \texttt{SCSimplicialComplex} etex) shifted c(14.3,2);

   

   
endfig;

verbatimtex
\end{document}
etex

end