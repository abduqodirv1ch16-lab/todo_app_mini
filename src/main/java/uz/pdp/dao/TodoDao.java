package uz.pdp.dao;

import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import uz.pdp.entity.Profile;
import uz.pdp.entity.Todo;

import java.util.List;
import java.util.Optional;

public class TodoDao extends BaseDao {

    private static final TodoDao instance = new TodoDao();

    private TodoDao() {
    }

    public static TodoDao getInstance() {
        return instance;
    }

    public List<Todo> getAll(Profile profile) {
        TypedQuery<Todo> query = em().createQuery("select t from Todo t where t.profile=?1", Todo.class);
        query.setParameter(1, profile);
        List<Todo> resultList = query.getResultList();
        return resultList;
    }


    public void save(Todo todo) {
        begin();
        em().persist(todo);
        commit();
    }

    public void update(boolean completed, Integer id) {
        begin();
        em().createQuery("update Todo t  set t.completed=?1 where t.id=?2")
                .setParameter(1, completed)
                .setParameter(2, id)
                .executeUpdate();
        commit();
        em().clear();
    }

    public Optional<Todo> getTodoById(Integer id) {
        try {
            TypedQuery<Todo> query = em().createQuery("select t from Todo t where t.id=?1", Todo.class);
            query.setParameter(1, id);
            Todo singleResult = query.getSingleResult();
            return Optional.of(singleResult);
        } catch (NoResultException e) {

        }
        return Optional.empty();

    }

    public void delete(Integer id) {

        Todo todo = getTodoById(id).get();

        begin();
        em().remove(todo);
        commit();
    }

}
