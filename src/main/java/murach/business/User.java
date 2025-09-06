package murach.business;

import java.io.Serializable;

public class User implements Serializable {
    private String firstName;
    private String lastName;
    private String email;

    // 👉 Thêm các field mới cho Survey
    private String dob;
    private String heardFrom;
    private String wantsUpdates;
    private String contactVia;

    public User() {
        this.firstName = "";
        this.lastName = "";
        this.email = "";
        this.dob = "";
        this.heardFrom = "";
        this.wantsUpdates = "No";
        this.contactVia = "";
    }

    public User(String firstName, String lastName, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    // Getter/Setter cho firstName, lastName, email
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    // 👉 Getter/Setter mới
    public String getDob() { return dob; }
    public void setDob(String dob) { this.dob = dob; }

    public String getHeardFrom() { return heardFrom; }
    public void setHeardFrom(String heardFrom) { this.heardFrom = heardFrom; }

    public String getWantsUpdates() { return wantsUpdates; }
    public void setWantsUpdates(String wantsUpdates) { this.wantsUpdates = wantsUpdates; }

    public String getContactVia() { return contactVia; }
    public void setContactVia(String contactVia) { this.contactVia = contactVia; }
}
