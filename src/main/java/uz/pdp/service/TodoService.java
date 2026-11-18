package uz.pdp.service;

import uz.pdp.dao.TodoDao;
import uz.pdp.entity.Profile;
import uz.pdp.entity.Todo;

import java.util.List;
import java.util.Optional;

public class TodoService {
    private static TodoService instance = new TodoService();

    private TodoService() {
    }

    public static TodoService getInstance() {
        return instance;
    }

    private final TodoDao todoDao = TodoDao.getInstance();

    public void create(String todo, Profile profile) {
        todoDao.save(Todo.builder().todo(todo).profile(profile).completed(false).build());
    }

    public List<Todo> getAll(Profile profile) {
        return todoDao.getAll(profile);
    }

    public void update(boolean completed, Integer id) {
        todoDao.update(completed, id);
    }

    public void delete(Integer id) {
        todoDao.delete(id);
    }

}
