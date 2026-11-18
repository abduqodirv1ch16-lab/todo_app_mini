package uz.pdp.entity;


import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Builder
public class Profile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "full_name")
    private String fullName;
    @Column(name = "user_name")
    private String userName;
    private String password;

    @OneToMany(fetch = FetchType.LAZY , mappedBy = "profile", cascade = CascadeType.REMOVE)
    private List<Todo> todos;

}
