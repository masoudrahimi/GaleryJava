package galery.model;

/**
 * Created by masaoud on 17/11/2017.
 */
public class Question {
    private int id;
    private  String Question;

    public Question() {
    }

    public Question(int id, String question) {
        this.id = id;
        Question = question;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String question) {
        Question = question;
    }
}
