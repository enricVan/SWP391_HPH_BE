package fu.swp.dorm_mnm.dto.base;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import fu.swp.dorm_mnm.model.RequestApplication;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RequestApplicationDto {
    private Long requestApplicationId;
    private Long requestApplicationTypeId;
    private String requestApplicationTypeName;
    private String textResponse;
    private String createdAt;
    private String updatedAt;
    private String requestContent;
    private String status;

    public RequestApplicationDto(RequestApplication requestApplication) {
        String pattern = "dd/MM/yyyy HH:mm:ss";
        DateFormat df = new SimpleDateFormat(pattern);

        this.requestApplicationId = requestApplication.getRequestApplicationId();
        this.requestApplicationTypeId = requestApplication.getRequestApplicationType().getRequestApplicationTypeId();
        this.requestApplicationTypeName = requestApplication.getRequestApplicationType()
                .getRequestApplicationTypeName();
        this.textResponse = requestApplication.getRequestContent();
        this.createdAt = requestApplication.getCreatedAt() != null ? df.format(requestApplication.getCreatedAt()) : null;
        this.updatedAt = requestApplication.getUpdatedAt() != null ? df.format(requestApplication.getUpdatedAt()) : null;
        this.requestContent = requestApplication.getRequestContent();
        this.status = requestApplication.getStatus();
    }

}
