public void selectionSort(int i, int[] numbers){
  if(i < numbers.length-1){
    int min = i;
        for(int j = i+1; j < numbers.length; j++) {
            if(numbers[min]>numbers[j]) {
                min = j;
            }
        }
        swapElements(numbers, min, i);
        int col = (i+1 *10);
        drawShadedBars(new int[] {col, col, col});
        ssCount++;
  }
  
}

// add a swap to the count of comparisons
public void swapElements(int[] arr, int index_a, int index_b){
  if(index_a!=index_b) { 
            int k = arr[index_a];
            arr[index_a]= arr[index_b];
            arr[index_b] = k;
        }
}


public int selectionSortStep(int [] array, int i) {
    int min = i;
        for(int j = i+1; j < array.length; j++) {
            if(array[min]>array[j]) {
                min = j;
            }
        }
   return min;
}


void drawAxis(){
  line(5, 580, 780, 580);
  line(5, 5, 5, 580);
}

void drawBar(Bar bar, int x, int y){
    fill(bar.rgb[0], bar.rgb[1], bar.rgb[2]);
    rect(x, y, 10, -bar.frequency);
}

void drawOriginalBar(Bar bar, int x, int y){
    fill(bar.rgb[0], bar.rgb[1], bar.rgb[2]);
    rect(x, y, 10, -bar.frequency);
}

void drawShadedBar(Bar bar, int x, int y){
    fill(0, 256, 0, 10);
    rect(x, y, 10, -bar.frequency);
}

void drawShadedBars(int[] rgb){
  int y = 578;
  int startX = 10;
  int spacing = 2;
  Bar[] bars = getBars(numbers,rgb);
  for(int i = 0; i < bars.length; i++){
    Bar bar = bars[i];
    drawShadedBar(bar, startX * (i+1) + spacing, y);
  }
}

void drawOriginalBars(int[] rgb){
  int y = 578;
  int startX = 10;
  int spacing = 2;
  Bar[] bars = getBars(numbers,rgb);
  for(int i = 0; i < bars.length; i++){
    Bar bar = bars[i];
    drawOriginalBar(bar, startX * (i+1) + spacing, y);
  }
}


int[] getRGBFreq(int value){
  return new int[]{value, value + 35, value + 40};
}

int[] getBlackRGB(){
  return new int[]{0, 0, 0};
}

int[] getRedRGB(){
  return new int[]{256, 0, 0};
}

void populateArray(){
  Random random = new Random();
  for(int i = 0; i < numbers.length; i++){
    int number = random.nextInt(200);
    numbers[i] = number;
  }
}

Bar[] getBars(int[] arr, int[] rgb){
  Bar[] bars = new Bar[arr.length];
  for(int i = 0; i < bars.length; i++){
    int value = arr[i];
      bars[i] = new Bar(value, value, rgb);
  }
  return bars;
}

class Bar{
  int value;
  int frequency;
  public int[] rgb;
  Bar(int value, int frequency, int[] rgb){
    this.value = value; this.frequency = frequency;
    this.rgb = rgb;
  }
}
