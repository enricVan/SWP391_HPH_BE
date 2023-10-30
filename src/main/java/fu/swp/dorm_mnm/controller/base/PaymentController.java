package fu.swp.dorm_mnm.controller.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.dto.base.PaymentDto;
import fu.swp.dorm_mnm.model.Payment;
import fu.swp.dorm_mnm.service.base.PaymentService;

@RestController
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PutMapping("/check/{id}")
    public ResponseEntity<PaymentDto> checkPaymentBedRequest(@PathVariable Long id,
            @RequestParam(required = true) Long managerId) {
        Payment payment = paymentService.checkPaymentBedRequest(id, managerId);
        return payment != null ? new ResponseEntity<>(new PaymentDto(payment), HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @PutMapping("/uncheck/{id}")
    public ResponseEntity<PaymentDto> unCheckPaymentBedRequest(@PathVariable Long id,
            @RequestParam(required = true) Long managerId) {
        Payment payment = paymentService.unCheckPaymentBedRequest(id, managerId);
        return payment != null ? new ResponseEntity<>(new PaymentDto(payment), HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
