class Floor {
  ArrayList<Vec2> surface;

  Floor()
  {
    surface = new ArrayList<Vec2>();

    surface.add(new Vec2(0, height));
    surface.add(new Vec2(width, height));
    
    ChainShape chain = new ChainShape();

    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }

    chain.createChain(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }

  void display() 
  {
    strokeWeight(1);
    stroke(255);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x, v.y);
    }
    endShape();
  }
}