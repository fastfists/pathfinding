Node target;
int branchCount = 4;
float branchLength;
float x, y;
Group path;

void setup() {
    size(600, 400);
    target = new Node(random(width), random(height));
    strokeWeight(1);
    background(255);
    frameRate(1);
    x = random(width);
    y = random(height);
    branchLength = target.distance(new Node(x, y)) / 2;    
    path = new Group(x, y);
}

boolean pathFind(Group start, Node target){
    /** Returns if the full path has been found*/
    Node best = start.closestNode(target);
    float distance = best.distance(target);
    path.add(best);
    if (abs(distance) < 9){
        return true;
    }
    branchLength = distance/2;
    x = best.x2;
    y = best.y2;
    return false;
}

void draw(){
    Group dude = new Group(x, y);
    dude.branch(branchCount, branchLength);
    if (pathFind(dude, target)){
        stroke(255,0,0);
        strokeWeight(10);
        path.draw();
        strokeWeight(0);
        noLoop();
        println("done");
    }
    
    stroke(0,0,0);
    dude.draw();
    stroke(0, 255, 0);
    strokeWeight(10);
    target.draw();
    strokeWeight(1);
    println("target: "+target);
    stroke(0, 0, 0);
}
