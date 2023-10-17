package fu.swp.dorm_mnm.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoomDto {
    private String roomName;
    private float roomPrice;
    private Long roomType;
    private Long building;
    private Long floor;
}
