package fu.swp.dorm_mnm.dto;

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
    private double amount;
    private String createdAt;
    private String updatedAt;
    private BedRequestDto bedRequestDto;
    public PaymentDto(Payment payment){
        String pattern = "dd/MM/yyyy HH:mm:ss";
        DateFormat df = new SimpleDateFormat(pattern);
        this.paymentId=payment.getPaymentId();
        this.managerId=payment.getManager().getManagerId();
        this.studentId=payment.getStudent().getStudentId();
        this.bedRequestDto=new BedRequestDto(payment.getBedRequest());
        this.amount=payment.getAmount();
        this.createdAt= df.format(payment.getCreatedAt());
        this.updatedAt= df.format(payment.getUpdatedAt());
    }
}
