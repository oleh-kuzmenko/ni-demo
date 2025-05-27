package com.ol.nidemo.rest;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/api/v1/demo")
public class DemoController {

  @PostMapping
  void hello(@RequestBody HelloRequest request) {
    log.info("Received request: {}", request);
  }

  @JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
  public record HelloRequest(String firstName, String lastName) {

  }

}
