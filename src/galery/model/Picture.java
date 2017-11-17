package galery.model;

/**
 * Created by masaoud on 17/11/2017.
 */
public class Picture {
    private int id;
    private int categoryId;
    private  String AddressPicture;

    public Picture() {
    }

    public Picture(int id, int categoryId, String addressPicture) {
        this.id = id;
        this.categoryId = categoryId;
        AddressPicture = addressPicture;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getAddressPicture() {
        return AddressPicture;
    }

    public void setAddressPicture(String addressPicture) {
        AddressPicture = addressPicture;
    }
}
