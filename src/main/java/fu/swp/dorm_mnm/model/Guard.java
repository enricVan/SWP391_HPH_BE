package fu.swp.dorm_mnm.model;

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
@Table(name = "guard")
public class Guard {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "guard_id")
    private Long guardId;

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    @OneToMany(mappedBy = "guard", targetEntity = GuardShift.class)
    private List<GuardShift> guardShifts;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
    // Constructors, getters, and setters
}
