package fu.swp.dorm_mnm.controller.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import fu.swp.dorm_mnm.model.Payment;
import fu.swp.dorm_mnm.service.base.PaymentService;

@RestController
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PutMapping("/{id}")
    public ResponseEntity<Payment> checkPaymentBedRequest(@PathVariable Long id,
            @RequestParam(required = true) Long managerId) {
        Payment payment = paymentService.updatePaymentBedRequest(id, managerId);

    }

}
