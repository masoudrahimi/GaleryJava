package galery.model;

/**
 * Created by masaoud on 17/11/2017.
 */
public class Rate {
    private int id;
    private int UserId;
    private int PictureId;
    private short rate;

    public Rate() {
    }

    public Rate(int id, int userId, int pictureId, short rate) {
        this.id = id;
        UserId = userId;
        PictureId = pictureId;
        this.rate = rate;
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

    public short getRate() {
        return rate;
    }

    public void setRate(short rate) {
        this.rate = rate;
    }
}
