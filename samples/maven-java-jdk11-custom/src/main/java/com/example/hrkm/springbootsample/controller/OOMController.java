package com.example.hrkm.springbootsample.controller;

import java.io.ByteArrayOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/oom")
public class OOMController {
  private Logger log = LoggerFactory.getLogger(getClass());


  @RequestMapping(value = "/trigger", method = RequestMethod.GET)
  public String trigger() throws Exception {
    ByteArrayOutputStream out = new ByteArrayOutputStream();

    byte[] src = new byte[1024 * 1024];
    for (int i = 0, len = src.length; i < len; i++) {
      src[i] = (byte) (0x000000ff & i);
    }

    // 1MiB x 8092 bytes
    for (int i = 0, len = 1024 * 1024; i < len; i++) {
      out.write(src, 0, src.length);
      log.info("dummy memory size = {}", out.toByteArray().length);

      Thread.sleep(10);
    }
    return "hello.";
  }
}
