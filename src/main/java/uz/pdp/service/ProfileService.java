package uz.pdp.service;

import uz.pdp.dao.ProfileDao;
import uz.pdp.entity.Profile;

import java.util.Optional;

public class ProfileService {
    private static ProfileService instance = new ProfileService();

    private ProfileService() {
    }

    public static ProfileService getInstance() {
        return instance;
    }

    private final ProfileDao profileDao = ProfileDao.getInstance();

    public boolean register(String fullName, String username, String password) {
        Optional<Profile> profileByUsername = profileDao.getProfileByUsername(username);
        if (profileByUsername.isPresent()) return false;
        profileDao.save(Profile.builder().fullName(fullName).userName(username).password(password).build());
        return true;
    }


    public Profile login(String username, String password) {

        if (username == null || password == null) return null;


        Optional<Profile> profileByUsername = profileDao.getProfileByUsername(username);

        if (profileByUsername.isEmpty()) return null;

        Profile profile = profileByUsername.get();

        if (!profile.getPassword().equals(password)) return null;


        return profile;
    }
}
