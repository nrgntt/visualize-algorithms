import java.util.*;

PFont f;
int[] numbers = new int[70];
ArrayList<Bar> Bars;

boolean once = false;
int searchedValue = -1;
int stepSerialCount = 0;
int stepBinaryCount = 0;
boolean serialSearchStarted = false;
boolean binarySearchStarted = false;
int l = 0;
int r = numbers.length -1;

void setup() {
  frameRate(5);
  background(255);
  
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  size(800, 900);
    
  populateArray(numbers);
  Arrays.sort(numbers);
  Bars = getBars(numbers, new int[] {0, 0, 0});
  
 drawAxis();
 drawBars(Bars, 1, -1, false);
 drawBars(Bars, -1, -1, false);
  
  //noLoop();
}



void reset(){
  if((serialSearchStarted || binarySearchStarted)) return;
  once = false;
  searchedValue = -1;
  stepSerialCount = 0;
  stepBinaryCount = 0;
  l = 0;
  r = numbers.length -1;
}


void draw(){
 /* println("DRAW");
  println("step serial count: " + stepSerialCount);
  println("step binary count: " + stepBinaryCount); */
  
  // condizione di ricerca avviata
  if(serialSearchStarted){
    if(stepSerialCount<numbers.length){
      int res = seqSearchStep(searchedValue, stepSerialCount, numbers[stepSerialCount]);
      if(res==1){
        clearSequentialFoundResult();
        drawSequentialFoundResult(searchedValue);
        serialSearchStarted = false;
        reset();
        //println("sequential ended");
      }
      else
      stepSerialCount++;
    }
  }
  
  if(binarySearchStarted){
    int res = binaryStep(searchedValue, stepBinaryCount);
      if(res!=-1){
        clearBinaryFoundResult();
        drawBinaryFoundResult(searchedValue);
        binarySearchStarted = false;
        reset();
        //println("binary ended");
      }
      else if (stepBinaryCount < numbers.length) stepBinaryCount++;
  }
  
 
 if(mousePressed && !once){
   processMouseClick(); //<>//
 }
}

void processMouseClick(){
 //println(mouseX + ", " +mouseY);
 
   Bar bar = null;
   for (int i = 0; i < Bars.size(); i++) {
     Bar b = Bars.get(i);
     if (b.getRectValue(mouseX, mouseY, 10)!=-1){
       bar = b;
       break;
     }
    }
    if(bar!=null){
       searchedValue = bar.value;
       //println("value to search: " + searchedValue);
       clearSearchingText();
       drawSearchingText(bar.value);
       once =  true;
       serialSearchStarted = true;
       binarySearchStarted = true;
     } 
}
