import java.util.Random;
import java.util.Arrays;
import java.util.List;

int[] numbers = new int[30];
ArrayList<int[]> frequencies;

void setup() {  
  populateArray();
  //numbers = sortArray(0);
  
  println(numbers);
  size(800, 600);
}

void draw() {
  drawAxis();
  drawBars();
  //drawBarsWithFrequencies()
}

void drawAxis(){
  line(5, 580, 780, 580);
  line(5, 5, 5, 580);
}

void drawBars(){
  int y = 578;
  int startX = 8;
  int spacing = 2;
  Bar[] bars = getBars(numbers);
  for(int i = 0; i < bars.length; i++){
    Bar bar = bars[i];
    fill(bar.rgb[0], bar.rgb[1], bar.rgb[2]);
    rect(startX * (i+1) + spacing, y, 5, -bar.frequency);
  }
  
}

void drawBarsWithFrequencies(){
  int y = 578;
  int startX = 8;
  int spacing = 2;
  Bar[] bars = getFrequencyBars(getFrequencies(numbers));
  for(int i = 0; i < bars.length; i++){
    Bar bar = bars[i];
    fill(bar.rgb[0], bar.rgb[1], bar.rgb[2]);
    rect(startX * (i+1) + spacing, y, 5, -bar.frequency * 10);
  }
  
}


ArrayList<int[]> getFrequencies(int arr[])
{
    int n = arr.length;
    ArrayList<int[]> frequencies = new ArrayList<int[]>();
    boolean visited[] = new boolean[n];
    Arrays.fill(visited, false);
    for (int i = 0; i < n; i++) {
        if (visited[i] == true)
            continue;
        int count = 1;
        for (int j = i + 1; j < n; j++) {
            if (arr[i] == arr[j]) {
                visited[j] = true;
                count++;
            }
        }
        frequencies.add(new int[]{arr[i], count}); 
    }
    return frequencies;
}

int[] getRGB(int value){
  return new int[]{value, value + 35, value + 40};
}


void populateArray(){
  Random random = new Random();
  for(int i = 0; i < numbers.length; i++){
    int number = random.nextInt(200);
    numbers[i] = number;
  }
}

Bar[] getFrequencyBars(ArrayList<int[]> arr){
  Bar[] bars = new Bar[arr.size()];
  for(int i = 0; i < bars.length; i++){
      int[] b = arr.get(i);
      bars[i] = new Bar(b[0], b[1]);
  }
  return bars;
}

Bar[] getBars(int[] arr){
  Bar[] bars = new Bar[arr.length];
  for(int i = 0; i < bars.length; i++){
    int value = arr[i];
      bars[i] = new Bar(value, value);
  }
  return bars;
}

class Bar{
  int value;
  int frequency;
  int[] rgb;
  Bar(int value, int frequency){
    this.value = value; this.frequency = frequency;
    this.rgb = getRGB(value);
  }
}
