package galery.model;

/**
 * Created by masaoud on 17/11/2017.
 */
public class Comment {
    private int id;
    private  int UserId;
    private  int PictureId;
    private String Comment;

    public Comment() {
    }

    public Comment(int id, int userId, int pictureId, String comment) {
        this.id = id;
        UserId = userId;
        PictureId = pictureId;
        Comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public int getPictureId() {
        return PictureId;
    }

    public void setPictureId(int pictureId) {
        PictureId = pictureId;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String comment) {
        Comment = comment;
    }
}

