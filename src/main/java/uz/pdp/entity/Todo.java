package uz.pdp.entity;


import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Builder
public class Todo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String todo;
    private boolean completed;

    @ManyToOne(fetch = FetchType.LAZY)
    private Profile profile;
}
