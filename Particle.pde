class Particle 
{
  Body body;
  float size;
  color bodyColor;

  Particle(float x_, float y_) {
    size = random(10, 20);
    bodyColor = color(random(128, 255), random(128, 255), random(128, 255));
    makeBody(new Vec2(x_, y_));
  }

  void makeBody(Vec2 center) {

    CircleShape cs = new CircleShape();
    float box2dSize = box2d.scalarPixelsToWorld(size);
    cs.setRadius(box2dSize / 2);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.5;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }

  boolean isDead() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.x < 0 || pos.x > width + size || pos.y > height + size) {
      box2d.destroyBody(body);
      return true;
    }
    return false;
  }

  void display() 
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    fill(bodyColor);
    noStroke();
    translate(pos.x, pos.y);
    ellipse(0, 0, size, size);
    popMatrix();
    
  }
}