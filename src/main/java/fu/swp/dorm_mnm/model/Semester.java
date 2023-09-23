package fu.swp.dorm_mnm.model;

import javax.persistence.*;
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
@Table(name = "semester")
public class Semester {

    @Temporal(TemporalType.DATE)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.DATE)
    @Column(name = "updated_at")
    private Date updatedAt;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "semester_id")
    private Long semesterId;

    @Column(name = "semester_name")
    private String semesterName;

    @Column(name = "start_date")
    private Date startDate;

    @Column(name = "end_date")
    private Date endDate;

}


