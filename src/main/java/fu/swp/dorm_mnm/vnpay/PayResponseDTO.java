package fu.swp.dorm_mnm.vnpay;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayResponseDTO implements Serializable {
    private String status;
    private String message;
    private String url;
}
