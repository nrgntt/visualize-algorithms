void populateArray(int[] numbers){
  Random random = new Random();
  for(int i = 0; i < numbers.length; i++){
    int number = random.nextInt(200);
    numbers[i] = number;
  }
}

class Bar{
  int value;
  int frequency;
  int[] rgb;
  int x; int y;
  Bar(int value, int frequency, int[] rgb){
    this.value = value; this.frequency = frequency;
    this.rgb = rgb;
  }
  public int getRectValue(int x, int y, int w){
    // se compreso nelle coordinate + larghezza
    // restituisco il valore, altrimenti -1
    if((x<=this.x+w && x>=this.x) && (Math.abs(y)<=Math.abs(450 + value) && Math.abs(y)>=Math.abs(450 - value))) return this.value; //<>//
    return -1;
  }
}

ArrayList<Bar> getBars(int[] arr, int[] rgb){
  ArrayList<Bar> bars = new ArrayList<Bar>();
  for(int i = 0; i < arr.length; i++){
    int value = arr[i];
      bars.add(new Bar(value, value, rgb));
  }
  return bars;
}

void drawBar(Bar bar, int upper, boolean changeColor, boolean found){
  if(changeColor){
    if(!found)fill(256, 0, 0, 70); else fill(0, 256, 0, 70);
  }
  else
    fill(255, 255, 255, 70);
    
    rect(bar.x, bar.y, 10, upper * bar.frequency);
}



void drawBars(ArrayList<Bar> bars, int upper, int elcfr, boolean found){
  int y = 450;
  int startX = 10;
  int spacing = 2;
  for(int i = 0; i < numbers.length; i++){
    bars.get(i).x = startX * (i+1) + spacing;
    bars.get(i).y = y;
    boolean changeColor = i==elcfr;
    drawBar(bars.get(i), upper, changeColor, found);
  }
}

void clearSearchingText(){
  fill(255,255,255);
  rect(25, 85, 300, 60);
}

void drawSearchingText(int found){
   textFont(f,20);
   fill(0);
   text("Searching for: " + found, 30, 120);
}

void drawBinaryFoundResult(int found){
   textFont(f,20);
   fill(0);
   text("Binary has found: " + found, 30, 900-30);
}

void clearBinaryFoundResult(){
  fill(255,255,255);
  rect(25, 900-68, 300, 60);
}

void clearSequentialFoundResult(){
  fill(255,255,255);
  rect(25, 10, 300, 60);
}

void drawSequentialFoundResult(int found){
   textFont(f,20);
   fill(0);
   text("Sequential has found: " + found, 30, 40);
}

void drawSequentialNotFoundResult(){
   textFont(f,20);
   fill(0);
   text("Sequential, value not found", 30, 40);
}

void drawAxis(){
  line(5, 450, 780, 450);
  line(5, 5, 5, 450);
}
