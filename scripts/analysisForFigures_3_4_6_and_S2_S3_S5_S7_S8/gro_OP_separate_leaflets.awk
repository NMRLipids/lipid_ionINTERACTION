BEGIN {
      ind = 0      
      frame = 0
      Cread = 0
      Hread = 0
      FIELDWIDTHS = "5 5 5 5 8 8 8 8 8 8"
}
{
      
      if($3==Cname){
	  Cx=$5;
	  Cy=$6;
	  Cz=$7;
	  Cread=1;
	  #print $0
      }
      if($3==Hname){
	  #print $0
	  Hx=$5;
	  Hy=$6;
	  Hz=$7;
	  Hread=1;
      }
      if(Cread*Hread==1){
	  Cread=0;
	  Hread=0;
	  dx=Cx-Hx; 
	  dy=Cy-Hy;
	  dz=Cz-Hz;
	  dz2=dz*dz;
	  OP=dz2/(dx*dx+dy*dy+dz2); # cosine squared
	  OP=1/2*(3*OP-1);
	  if(Cz > boxCenter){ # assumes bilayer center is at the box center
	      printf(" %gU", OP); # upper leaflet
	  }
	  else{
	      printf(" %gL", OP); # lower leaflet
	  }
      }
}
END {
    printf("\n");
}
