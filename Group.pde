public class Group{

    float x, y;
    ArrayList<Node> branches;
    public Group(Node start_pos) {
        this.x = start_pos.x2;
        this.y = start_pos.y2;
        branches = new ArrayList();
    }

    public Group(float x, float y) {
        this.x = x;
        this.y = y;
        branches = new ArrayList();
    }
    
    void add(Node n) {
       this.branches.add(n);
    }

    /**
    * Creates mulitple nodes that branch out from its position
    * @param branchCount the number of branches to create
    */
    public void branch(int branchCount, float lineLength){
        for(int i=0; i< branchCount; i++){
            this.add(new Node(x, y, lineLength, map(i, 0, branchCount-1, 0, 360)));
        }
    }
    public void draw(){
        for(Node line: branches){
            line.draw();
        }
    }

    public String toString(){
        String returnVal = "";
        for(Node line: branches){
            returnVal += line.toString() + "\n";
        }
        return returnVal;
    }

    public Node closestNode(Node targetValue){
        float closest = width*height;
        Node bestFit = null;
        for(Node line: branches){
            float distance = line.distance(targetValue);
            if (distance < closest){
                closest = distance;
                bestFit = line;
            }
        }
        print("best fit dist: ");
        println(bestFit.distance(targetValue));
        return bestFit;
    }

}
