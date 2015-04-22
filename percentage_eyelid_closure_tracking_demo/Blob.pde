/**
 * Blob Class
 *
 * Based on this example by Daniel Shiffman:
 * http://shiffman.net/2011/04/26/opencv-matching-faces-over-time/
 * 
 * @author: Jordi Tost (@jorditost)
 * 
 * University of Applied Sciences Potsdam, 2014
 */

class Blob {
  Rectangle r;
  
  private PApplet parent;
  
  // Contour
  public Contour contour;
  
  // Am I available to be matched?
  public boolean available;
  
  // Should I be deleted?
  public boolean delete;
  
  // How long should I live if I have disappeared?
  private int initTimer = 25; //127;
  public int timer;
  
  // Unique ID for each blob
  int id;
  
  float w_max=0;
  float w_min=1000;
   float h_max=0;
  float h_min=1000;
  float peo; //percentage eye open
  // Make me
  Blob(PApplet parent, int id, Contour c) {
    this.parent = parent;
    this.id = id;
    this.contour = new Contour(parent, c.pointMat);
    
    available = true;
    delete = false;
    
    timer = initTimer;
  }
  
  // Show me
  void  display()
  {
  r = contour.getBoundingBox();
    
    float opacity = map(timer, 0, initTimer, 0, 127);
    fill(0,0,255,opacity);
    stroke(0,0,255);
    rect(r.x, r.y, r.width, r.height);
    println("width = "+r.width,"height = "+r.height);
    fill(255,2*opacity);
    textSize(26);
    //text(""+id, r.x+10, r.y+30);
     int radius=r.width/2;
     int radius2=r.height/2;
    ellipse(r.x+radius,r.y+radius,radius/1.5,radius/1.5);
    
    if (r.height > w_max) 
    w_max=r.height;
    
    if (r.height<w_min)
    w_min=r.height;
    
    
    if (r.width > h_max) 
    h_max=r.width;
    
    if (r.height<h_min)
    h_min=r.width;
    
    //percentge eyee open
    
    if ((h_max!=h_min) || (w_max!=w_min))
    {
    peo = ((r.height-h_min)*0.5+(r.width-w_min)*0.5)/((h_max-h_min)*0.5+(w_max-w_min)*0.5);
    }
    println("percentage eye open: "+peo*100+"%");
    //println(r.width-r.height);
    
  //   for (int i = 0; i < faces.length; i++) {
    //if ((r.width<40)&&(r.height<40)&&(abs(r.width-r.height)<15)&&
    //(abs(1-r.width/r.height)<0.3)&&((1-abs(r.width*r.height/(PI*pow(radius,2))))<0.3)&&
    //(abs(radius-radius2)<4)&&(r.x>faces[i].x) && (r.y>faces[i].y) && (r.x<(faces[i].x+faces[i].width/2)) 
    //&&(r.y<(faces[i].y+faces[i].height/2)))
       
    {//println(abs(r.width-r.height));
    //println(radius2-radius);
    //ellipse(r.x+radius,r.y+radius,radius/1.5,radius/1.5);
    //rect(r.x, r.y, r.width, r.height);  
   // }
} }

  // Give me a new contour for this blob (shape, points, location, size)
  // Oooh, it would be nice to lerp here!
  void update(Contour newC) {
    
    contour = new Contour(parent, newC.pointMat);
    
    // Is there a way to update the contour's points without creating a new one?
    /*ArrayList<PVector> newPoints = newC.getPoints();
    Point[] inputPoints = new Point[newPoints.size()];
    
    for(int i = 0; i < newPoints.size(); i++){
      inputPoints[i] = new Point(newPoints.get(i).x, newPoints.get(i).y);
    }
    contour.loadPoints(inputPoints);*/
    
    timer = initTimer;
  }

  // Count me down, I am gone
  void countDown() {    
    timer--;
  }

  // I am deed, delete me
  boolean dead() {
    if (timer < 0) return true;
    return false;
  }
  
  public Rectangle getBoundingBox() {
    return contour.getBoundingBox();
  }
}

