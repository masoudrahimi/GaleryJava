package galery.model;

/**
 * Created by masaoud on 17/11/2017.
 */
public class State {
    private int id;
    private String StateTitle;

    public State() {
    }

    public State(int id, String stateTitle) {
        this.id = id;
        StateTitle = stateTitle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStateTitle() {
        return StateTitle;
    }

    public void setStateTitle(String stateTitle) {
        StateTitle = stateTitle;
    }
}
