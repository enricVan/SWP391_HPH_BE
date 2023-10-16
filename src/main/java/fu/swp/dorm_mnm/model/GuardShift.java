package fu.swp.dorm_mnm.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
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
@Table(name = "guard_shift")
public class GuardShift {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "guard_shift_id")
    private Long guardShiftId;

    @ManyToOne
    @JoinColumn(name = "building")
    private Building building;

    @ManyToOne
    @JoinColumn(name = "guard_id")
    private Guard guard;

    @ManyToOne
    @JoinColumn(name = "assign_by_manager_id")
    private Manager manager;

    @Column(name = "start_date_time")
    private Date startDate;

    @Column(name = "end_date_time")
    private Date endDate;

    @Column(name = "slot")
    private Integer slot;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;
}
