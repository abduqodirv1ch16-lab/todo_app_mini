package uz.pdp.dao;

import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import uz.pdp.entity.Profile;

import java.util.Optional;

public class ProfileDao extends BaseDao {

    private static ProfileDao instance = new ProfileDao();

    private ProfileDao() {
    }

    public static ProfileDao getInstance() {
        return instance;
    }


    public void save(Profile profile) {
        begin();
        em().persist(profile);
        commit();
    }

    public Optional<Profile> getProfileByUsername(String username) {

        try {
            TypedQuery<Profile> query = em().createQuery("select p from Profile  p where p.userName=?1", Profile.class);
            query.setParameter(1, username);
            Profile singleResult = query.getSingleResult();
            return Optional.of(singleResult);
        } catch (NoResultException e) {

        }

        return Optional.empty();
    }

}
