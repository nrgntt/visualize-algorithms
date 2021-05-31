int binaryStep(int x, int pos){
  
  //println("binary " + x + " " + numbers[pos]);
  
  if (l <= r) {
    
        int m = l + (r - l) / 2;

        // questo è l'elemento con cui fa il cfr , quindi la bar da colorare o da eliminare
        // drawBars con questo iesimo elemento di col diverso
        if (numbers[m] == x) {
          drawBars(Bars, 1, m, true);
          return m;
        } else {
          drawBars(Bars, 1, m, false);
          if (numbers[m] < x){
            l = m + 1;
          }
          else {
            r = m - 1;
          }
        }
    }
    return -1;
}
