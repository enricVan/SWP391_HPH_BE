package fu.swp.dorm_mnm.model;

import jakarta.persistence.*;
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
@Table(name = "bed_request")
public class BedRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bed_request_id")
    private Long bedRequestId;

    @OneToOne(mappedBy = "bedRequest", targetEntity = Payment.class)
    private Payment payment;

    @ManyToOne
    @JoinColumn(name = "bed_id")
    private Bed bed;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @Column(name = "semester_id")
    private Long semesterId;

    @Column(name = "status", length = 20)
    private String status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;

    // Constructors, getters, and setters
}
