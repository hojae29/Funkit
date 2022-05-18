package com.funkit.service;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.web.multipart.MultipartFile;

public interface FundingService {
    int makeFunding(Funding funding);

    void saveFunding(Funding<MultipartFile> funding);

    Funding<Image> getFunding(int code);
}
