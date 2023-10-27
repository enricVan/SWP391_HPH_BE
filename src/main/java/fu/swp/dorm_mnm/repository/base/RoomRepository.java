package fu.swp.dorm_mnm.repository.base;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fu.swp.dorm_mnm.model.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {

        @Query(value = "SELECT * FROM room r WHERE r.building_id = :buildingId", nativeQuery = true)
        public List<Room> getRoomsByBuildingId(@Param("buildingId") Long buildingId);

        @Query(value = "SELECT * FROM room r WHERE r.room_type_id = :roomTypeId", nativeQuery = true)
        public List<Room> getRoomsByRoomTypeId(@Param("roomTypeId") Long roomTypeId);

        @Query(value = "SELECT r.* FROM room r " +
                        "JOIN building b ON b.building_id = r.building_id " +
                        "JOIN room_type rt ON rt.room_type_id = r.room_type_id  " +
                        "JOIN bed be ON r.room_id = be.room_id " +
                        "WHERE (:buildingId is NULL or b.building_id = :buildingId) " +
                        "AND (:roomTypeId is NULL or rt.room_type_id = :roomTypeId) " +
                        "AND (:floor is NULL or r.floor = :floor) " +
                        "AND (:status is NULL or :status LIKE '' or be.`status` = :status) " +
                        "GROUP BY r.room_id;", nativeQuery = true)
        public List<Room> getRoomsByRoomTypeIdBuildingIdFloorStatus(@Param("roomTypeId") Long roomTypeId,
                        @Param("buildingId") Long buildingId, @Param("floor") Integer floor,
                        @Param("status") String status);
}
