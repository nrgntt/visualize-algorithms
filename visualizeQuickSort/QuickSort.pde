public int partition(int arr[], int low, int high)
{
    int pivot = arr[high];

    int i = (low - 1);
    for (int j = low; j <= high - 1; j++) {

        if (arr[j] <= pivot) {
            i++;

            int temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }

    int temp = arr[i + 1];
    arr[i + 1] = arr[high];
    arr[high] = temp;

    return i + 1;
}

public void QS(int arr[], int l, int h){
  h = stack[top--];
  l = stack[top--];

  int p = partition(arr, l, h);

  if (p - 1 > l) {
      stack[++top] = l;
      stack[++top] = p - 1;
  }
  
  drawShadedQSBars(new int[] {256, 0, 0}, l, h );

  if (p + 1 < h) {
      stack[++top] = p + 1;
      stack[++top] = h;
  } 
  
  drawShadedQSBars(new int[] {256, 0, 0}, l, h );
    
}

void drawQSBar(Bar bar, int x, int y){
    fill(bar.rgb[0], bar.rgb[1], bar.rgb[2]);
    rect(x, y, 10, bar.frequency);
}

void drawRedQSBar(Bar bar, int x, int y){
    fill(256, 0, 0, 50);
    rect(x, y, 10, bar.frequency);
}

void drawShadedQSBars(int[] rgb, int l, int h){ //<>//
  
  //print(h);print("..."); print(l);print("...=");print(h-l);print("...");
  int[] arr = new int[h-l];
  for(int i = l; i < h-l; i++){
    arr[i] = numbersQS[i];
  }
  int y = 578;
  int startX = 10;
  int spacing = 2;
  Bar[] bars = getQSBars(arr,rgb);
  for(int i = 0; i < bars.length; i++){
    Bar bar = bars[i];
    drawRedQSBar(bar, (l * 12) + startX * (i+1) + spacing, y);
  }
}

void drawOriginalQSBars(int[] rgb){
  int y = 578;
  int startX = 10;
  int spacing = 2;
  Bar[] bars = getBars(numbersQS,rgb);
  for(int i = 0; i < bars.length; i++){
    Bar bar = bars[i];
    drawQSBar(bar, startX * (i+1) + spacing, y);
  }
}

Bar[] getQSBars(int[] arr, int[] rgb){
  Bar[] bars = new Bar[arr.length];
  for(int i = 0; i < bars.length; i++){
    int value = arr[i];
      bars[i] = new Bar(value, value, rgb);
  }
  return bars;
}
