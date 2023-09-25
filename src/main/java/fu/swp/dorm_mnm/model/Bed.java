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
@Table(name = "bed")
public class Bed {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bed_id")
    private Long bedId;

    @ManyToOne
    @JoinColumn(name = "room_id")
    private Room room;

    @Column(name = "bed_name", length = 20)
    private String bedName;

    @Column(name = "price")
    private Float price;

    @Column(name = "status", length = 50)
    private String status;

    // @OneToMany(mappedBy = "bed")
    // private List<BedRequest> bedRequest;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
    // Constructors, getters, and setters
}

