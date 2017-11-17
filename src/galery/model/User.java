package galery.model;

/**
 * Created by masaoud on 17/11/2017.
 */
public class User {
    private int id;
    private String name;
    private String family;
    private String userName;
    private String password;
    private int stateId;
    private  int questionId;
    private String answer;

    public User() {
    }

    public User(int id, String name, String family, String userName, String password, int stateId, int questionId, String answer) {
        this.id = id;
        this.name = name;
        this.family = family;
        this.userName = userName;
        this.password = password;
        this.stateId = stateId;
        this.questionId = questionId;
        this.answer = answer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFamily() {
        return family;
    }

    public void setFamily(String family) {
        this.family = family;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
