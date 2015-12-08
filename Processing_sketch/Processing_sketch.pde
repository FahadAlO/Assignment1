ArrayList<String> Footballstadiums;
ArrayList<Football> football;
ArrayList<Integer> sumData;
int firstYear= 0;
void setup()
{
   size(1000,790);
   background(80);
   drawTrendLineGraph();
   loadData();
   
  float border = 0.1 * width;
     
  drawAxis(sumData, 10, 10, 99354.0, border);

}
void loadSumData() {
  // instantiate the sumData container
  sumData = new ArrayList<Integer>();
  String[] lines = loadStrings("sum.csv"); // Load each line into a String array
  for(String s:lines)
  {
    // Add each element from the string array to the arraylist
    Integer f = Integer.parseInt(s);
    sumData.add(f);
  }
}

void loadData()
{
    Footballstadiums = new ArrayList<String>();
  
    String[] lines = loadStrings("Footballstadiums.csv");
  football = new ArrayList<Football>();
    
    for(int i=1; i<lines.length; i++)
    {
      football.add(new Football(lines[i]));
    }
    for (Football f: football)
    {
    
      
    }
}

float centX,centY;

void drawTrendLineGraph()
{
     float border = width * 0.1f;
     float textY = (border * 0.5f); 
     text("The biggest stuadium Europe", width * 0.5f, textY);
}
void draw()
{
     stroke(200, 200, 200);
     fill(200, 200, 200);
     float border = width * 0.1f;
     int x=0; 
     int y=0; 
     float ypoint,ypoint2;
     fill(255);
     
    ellipse(0 ,700,  15 ,15);
    
  for (Football f: football)
    {
      ellipseMode(CENTER);  
        x= x +10; 
        y++; 
       fill(250, 30, 80, 50);
       ypoint = 50 - f.Latitude/100 ; 
       ypoint2 = f.Longitude * 10; 
       int R= 6371;
       float x2 = R * cos(f.Latitude) * cos(f.Longitude)/10;
       float y2 = R * cos(f.Latitude) * sin(f.Longitude)/10;
             
  // Scale the mouseX value from 0 to 640 to a range between 0 and 175
  float c = map(x2, 10, width, 270, 500);
  // Scale the mousey value from 0 to 640 to a range between 40 and 300
  float d = map(y2, 10, width, 300, 500);
  println ( c + " : "+ d); 
    fill(255, c, 0);

      ellipse(   c  + 100,   d  ,  f.Capacity/1000 ,f.Capacity/1000);
    }

}
void drawAxis(ArrayList<Integer> data,
              // we no longer have horizontal labels,
              // rather we will draw the ticks as we do
              // for the vertical axis. This argument
              // indicates how many ticks we want.
              int horizontalIntervals,
              int verticalIntervals,
              float vertDataRange,
              float border)
{
  stroke(200, 200, 200);
  fill(200, 200, 200);

 // Draw the horizontal azis
  line(border, height - border, width - border, height - border);
  
  float horizontalWindowRange = (width - (border * 2.0f));
  float horizontalDataGap = 0.5;
  float horizontalWindowGap = 100;
  float tickSize = border * 0.1f;
  text("Capacity", 10, 320);
  
  for (int i = 0 ; i <=  horizontalIntervals; i ++)
  {
    // Draw the ticks
    float x = border + (i * horizontalWindowGap);
    line(x, height - (border - tickSize)
         , x, (height - border));
    float textY = height - (border * 0.5f);

    // Print the date
    textAlign(CENTER, CENTER);
    text((int)(firstYear + i*horizontalDataGap) , x, textY);
  }

  // Draw the vertical axis
  line(border, border , border, height - border);

  float verticalDataGap = vertDataRange / verticalIntervals;
  float verticalWindowRange = height - (border * 2.0f);
  float verticalWindowGap = verticalWindowRange / verticalIntervals;
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = (height - border) - (i * verticalWindowGap);
    line(border - tickSize, y, border, y);
    float hAxisLabel = verticalDataGap * i;

    textAlign(RIGHT, CENTER);
    text((int)hAxisLabel, border - (tickSize * 2.0f), y);
  }
       text("Map Scale", 500, 730);

}