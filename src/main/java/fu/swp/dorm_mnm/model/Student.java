package fu.swp.dorm_mnm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private Long studentId;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    @JsonIgnore
    @OneToMany(mappedBy = "student", targetEntity = BedRequest.class)
    private List<BedRequest> bedRequests;

    @JsonIgnore
    @OneToMany(mappedBy = "student", targetEntity = Payment.class)
    private List<Payment> payments;

    @JsonIgnore
    // @JsonBackReference
    @OneToOne(mappedBy = "student", targetEntity = Bed.class)
    private Bed bed;

    @Column(name = "parent_name", nullable = false, length = 100)
    private String parentName;

    @Column(name = "description", length = 200)
    private String description;

    @Column(name = "roll_number", unique = true, columnDefinition = "VARCHAR(8)")
    private String rollNumber;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
    // Constructors, getters, and setters
}
