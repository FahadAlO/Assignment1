PImage backgroundMap;
ArrayList<String> Footballstadiums;
ArrayList<Football> football;
 
float mapScreenWidth,mapScreenHeight;  // Dimension of map in pixels.

void setup()
{
  size(1000,700);
 
  smooth();
  noLoop();
  loadData();
  backgroundMap   = loadImage("location_map.jpg");
  mapScreenWidth  = width;
  mapScreenHeight = height;
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
         
}
void draw()
{
  image(backgroundMap,0,0,mapScreenWidth,mapScreenHeight);
  
        fill(70,150);
        stroke(89, 90, 100);
        
    for (Football f: football)
    {
      //Scale lat & long to x & y 
      int R= 6371;
      float x2 = R * cos(f.Latitude) * cos(f.Longitude)/10;
      float y2 = R * cos(f.Latitude) * sin(f.Longitude)/10;
      //map the values to pixels
      float c = map(x2, 0, width, 450, 700);
      // Scale the mousey value from 0 to 640 to a range between 40 and 300
      float d = map(y2, 0, width, 450, 700);

        fill(80, 40 , 80);
        ellipseMode(CENTER);  
        ellipse( c  , d , f.Capacity/1000 ,f.Capacity/1000);
        fill(0);
        text(f.Capacity,c, d );
    }
fill(80, 40, 80);
text("Capacity",100,100 );
fill(80, 40, 80);
rect(100, 105, 55, 55);
fill(0);

  text("The biggest stuadium Europe", 100, 80);

}
 