package fu.swp.dorm_mnm.dto.base;

import java.util.List;

import fu.swp.dorm_mnm.model.Building;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BuildingDto {
    private Long id;
    private String buildingName;
    private int numberFloor;
    private String createdAt;
    private String updateAt;
    private List<Integer> floors;

    public BuildingDto(Building b) {
        this.id = b.getBuildingId();
        this.buildingName = b.getBuildingName();
        this.numberFloor = b.getNumberFloor();
        this.createdAt = b.getCreatedAt().toString();
        this.updateAt = b.getUpdatedAt().toString();
    }

}
