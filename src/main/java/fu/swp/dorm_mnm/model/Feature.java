package fu.swp.dorm_mnm.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "feature")
public class Feature {
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feature_id")
    private Long featureId;

    @Column(name = "feature_name", nullable = false, length = 50)
    private String featureName;

    @Column(name = "url", nullable = false, length = 300)
    private String url;

    // @ManyToMany(mappedBy = "features")
    // private List<Role> roles;
    // Constructors, getters, and setters
}
