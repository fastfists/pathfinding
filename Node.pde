public class Node{

    float x, y, x2, y2;
    public Node(float x, float y, float length, float degree){
        this.x = x;
        this.y = y;
        this.x2 = (cos(radians(degree))*length) + this.x;
        this.y2 = (sin(radians(degree))*length) + this.y;
    }

    public Node(float x, float y){
        /** The "Lazy node" 
        * (just making a point)
        */
        this.x = x;
        this.y = y;
        this.x2 = x;
        this.y2 = y;
    }

    public String toString(){
        return "Node object x: "+ x + " y: "+y + " x2: " +x2+" y2: " +y2;
    }

    public void draw(){
        line(x, y, x2, y2);
    }

    public boolean equals(Node other){
        /** Assert the tips touch*/
        return round(other.x2) == round(this.x2) && round(other.y2) == round(this.y2);
    }

    public float distance(Node otherPostion){
        return dist(this.x2, this.y2, otherPostion.x2, otherPostion.y2);
    }
}
