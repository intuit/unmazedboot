package com.example.hrkm.springbootsample.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import com.example.hrkm.springbootsample.repository.FooRepository;

@Service
public class FooService {

  private Logger log = LoggerFactory.getLogger(getClass());

  @Autowired
  private FooRepository fooRepository;

  public List<String> search(String query) {
    if (StringUtils.isEmpty(query)) {
      throw new IllegalArgumentException(" query is required.");
    }
    log.info(" query = {}", query);
    return this.fooRepository.search(query);
  }
}
