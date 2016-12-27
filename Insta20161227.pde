import java.util.*;
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Windmill windmill1;
Windmill windmill2;
Floor floor;

ArrayList<Particle> particles;

void setup()
{
  size(1080, 1080);
  smooth();
  frameRate(60);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);

  windmill1 = new Windmill(width / 2 + 200, height - 201, 1);
  windmill2 = new Windmill(width / 2 - 200, height - 201, -1);
  floor = new Floor();
  
  particles = new ArrayList<Particle>();
}

void draw()
{
  background(0);
  box2d.step();
  
  windmill1.display();
  windmill2.display();
  floor.display();
  
  if(frameCount % 2 == 0)
  {
    particles.add(new Particle(width / 2 + random(-1, 1), 0));
  }
  
  Iterator<Particle> it = particles.iterator();
  while(it.hasNext())
  {
    Particle particle = it.next();
    particle.display();
    
    if(particle.isDead())
    {
      it.remove();
    }
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 3600)
  {
     exit();
  }
  */
}