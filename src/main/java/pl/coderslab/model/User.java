package pl.coderslab.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import javax.persistence.*;
import java.util.List;


@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Pole nie może być puste")
    @Email(message = " Podaj poprawny adres email ! ")
    private String email;

    private String password;

    private boolean admin;

    @OneToMany
    private List<Donation> donations;


}
