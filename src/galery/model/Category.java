package galery.model;

/**
 * Created by masaoud on 17/11/2017.
 */
public class Category {
    private int id;
    private String categoryTitle;
    private  String AddressPicture;

    public Category() {
    }

    public Category(int id, String categoryTitle, String addressPicture) {
        this.id = id;
        this.categoryTitle = categoryTitle;
        AddressPicture = addressPicture;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getAddressPicture() {
        return AddressPicture;
    }

    public void setAddressPicture(String addressPicture) {
        AddressPicture = addressPicture;
    }
}
