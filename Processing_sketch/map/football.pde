class Football
{
  String Team;
  String FDCOUK;
  String City;
  String Stadium;
  int Capacity;
  float Latitude;
  float Longitude;
  String Country;
  
  Football(String line)
  {
      String[] found = line.split(",");
      Team = found[0];
      FDCOUK = found[1];
      City = found[2];
      Stadium = found[3];
      Country = found[7];
      Capacity = Integer.parseInt(found[4]);
      Latitude = Float.parseFloat(found[5]);
      Longitude = Float.parseFloat(found[6]); 
  } 
}