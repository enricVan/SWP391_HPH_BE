package fu.swp.dorm_mnm.dto.base;

import fu.swp.dorm_mnm.model.Payment;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

@NoArgsConstructor
@Getter
@Setter
public class PaymentDto {

    private Long paymentId;
    private Long managerId;
    private Long studentId;
    private float amount;
    private String createdAt;
    private String updatedAt;
    private Long bedRequestId;
    private String status;

    public PaymentDto(Payment payment) {
        String pattern = "dd/MM/yyyy HH:mm:ss";
        DateFormat df = new SimpleDateFormat(pattern);
        this.paymentId = payment.getPaymentId();
        this.managerId = payment.getManager() != null ? payment.getManager().getManagerId() : null;
        this.studentId = payment.getStudent().getStudentId();
        this.bedRequestId = payment.getBedRequest().getBedRequestId();
        this.amount = payment.getAmount();
        this.createdAt = df.format(payment.getCreatedAt());
        this.updatedAt = df.format(payment.getUpdatedAt());
        this.setStatus(payment.getStatus());
    }
}
