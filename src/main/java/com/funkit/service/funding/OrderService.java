package com.funkit.service.funding;

import com.funkit.model.JsonResponse;
import com.funkit.model.PayInfo;
import org.springframework.http.ResponseEntity;

public interface OrderService {
    ResponseEntity addOrder(PayInfo payInfo);
}
