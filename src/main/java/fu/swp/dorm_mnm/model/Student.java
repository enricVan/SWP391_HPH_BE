package fu.swp.dorm_mnm.model;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Date;


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

     @OneToOne
     @JoinColumn(name = "user_id", nullable = false)
     private User user;

    // @OneToMany(mappedBy = "student")
    // private List<BedRequest> bedRequests;

    @Column(name = "parent_name", nullable = false, length = 100)
    private String parentName;

    @Column(name = "description", length = 200)
    private String description;

    @Column(name = "roll_number", unique = true, columnDefinition = "VARCHAR(6)")
    private String rollNumber;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
    // Constructors, getters, and setters
}

