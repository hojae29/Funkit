package com.funkit.service;

import com.funkit.model.Funding;
import com.funkit.model.Image;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FundingService {
    int makeFunding(Funding funding);

    void saveFunding(Funding<MultipartFile> funding, List<String> deleteImages);

    Funding<Image> getFunding(int code);
}
