package pl.coderslab.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Entity
@Table(name="donations")
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Min(1)
    private Long numberOfBags;

    @OneToOne
    private Item item;

    @OneToOne
    private Profile profile;

    @OneToOne
    private Institution institution;

    @NotBlank(message = " Podaj ulicę ! ")
    private String street;

    @NotBlank(message = " Podaj numer domu ! ")
    private String number;

    private String apartment;

    @NotNull
    @Pattern(message = " Podaj kod pocztowy w formacie XX-XXX ! ", regexp="[0-9]{2}\\-[0-9]{3}")
    private String zip;

    @NotBlank(message = " Podaj miasto ! ")
    private String city;

    @NotBlank(message = "Pole nie może być puste")
    @Pattern(message = " Podaj nr telefonu w formacie +48XXXXXXXXX ! ", regexp = "^\\+48\\d{9}$")
    private String phone;

    @Column(name="pickupDate")
    private LocalDate pickupDate;

    @Column(name="pickupTime")
    private LocalTime pickupTime;

    private String comments;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getNumberOfBags() {
        return numberOfBags;
    }

    public void setNumberOfBags(Long numberOfBags) {
        this.numberOfBags = numberOfBags;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDate getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(LocalDate pickupDate) {
        this.pickupDate = pickupDate;
    }

    public LocalTime getPickupTime() {
        return pickupTime;
    }

    public void setPickupTime(LocalTime pickupTime) {
        this.pickupTime = pickupTime;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Donation{" +
                "id=" + id +
                ", numberOfBags=" + numberOfBags +
                ", item=" + item +
                ", profile=" + profile +
                ", institution=" + institution +
                ", street='" + street + '\'' +
                ", number='" + number + '\'' +
                ", apartment='" + apartment + '\'' +
                ", zip='" + zip + '\'' +
                ", city='" + city + '\'' +
                ", phone='" + phone + '\'' +
                ", pickupDate=" + pickupDate +
                ", pickupTime=" + pickupTime +
                ", comments='" + comments + '\'' +
                '}';
    }
}
