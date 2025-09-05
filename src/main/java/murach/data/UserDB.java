package murach.data;

import murach.business.User;
import java.util.ArrayList;
import java.util.List;

public class UserDB {
    // danh sách giả lập thay cho database thật
    private static List<User> users = new ArrayList<>();

    public static void insert(User user) {
        users.add(user);
        System.out.println("Inserted user: " + user.getEmail());
    }

    public static List<User> getAllUsers() {
        return users;
    }
}
