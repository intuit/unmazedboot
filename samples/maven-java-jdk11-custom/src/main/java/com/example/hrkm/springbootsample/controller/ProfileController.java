package com.example.hrkm.springbootsample.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.example.hrkm.springbootsample.service.FooService;

@RestController
@RequestMapping("/profile")
public class ProfileController {
  @Autowired
  private FooService fooService;

  @RequestMapping(value = "/trigger", method = RequestMethod.GET)
  public List<String> trigger(
      @RequestParam(value = "q", required = false, defaultValue = "java") String query) {
    return this.fooService.search(query);
  }
}
