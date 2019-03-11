package pl.coderslab.model;

import org.hibernate.validator.constraints.NotBlank;
import javax.persistence.*;

@Entity
@Table(name="institutions")
public class Institution {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Podaj nazwę instytucji")
    private String name;

    @NotBlank(message = "Podaj cel i misję instytucji")
    private String description;

    @OneToOne
    private Profile profile;
}
