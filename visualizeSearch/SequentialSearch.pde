int seqSearchStep(int searchedValue, int pos, int stepValue)
{
  //println("sequential " + searchedValue + " " + stepValue);
    if(stepValue==searchedValue) 
      { drawBars(Bars, -1, pos, true); return 1;} 
    else {drawBars(Bars, -1, pos, false); return -1;}
}
