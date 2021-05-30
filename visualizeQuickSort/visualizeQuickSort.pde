import java.util.*;

int[] numbers = new int[70];
int[] numbersQS = new int[70];

void setup() {
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  size(800, 1200);
  frameRate(10);
  background(255);
  
  populateArray();
  for(int i = 0; i < numbers.length; i++){
    numbersQS[i] = numbers[i];
  }
  
  drawAxis();
  drawOriginalBars(new int[] {256, 256, 256});
  drawOriginalQSBars(new int[] {256, 256, 256});
  
  // QS
  stack[++top] = l;
  stack[++top] = h;
  
  //noLoop();
}

PFont f;



// selection sort index
int i = 0;
int ssCount = 0;

// QS
int qsCount = 0;
int l = 0;
int h = numbersQS.length-1;
int[] stack = new int[h - l + 1];
int top = -1;

void draw() {
  
    
  // SS
  if(i < numbers.length-1){
  selectionSort(i, numbers);
  i++;
  }else{
    textFont(f,20);
    fill(0);
    text("Selection sort count: " + ssCount, 30,20);
    text("Quick Sort count: " + qsCount, 30,40);
    noLoop();
  }
  
  // QS
  if(true){
    if(top >= 0){
     QS(numbersQS, l, h);
     qsCount++;
    }
    else{
      drawOriginalQSBars(numbersQS);
    }
  }
  
 
}
 
