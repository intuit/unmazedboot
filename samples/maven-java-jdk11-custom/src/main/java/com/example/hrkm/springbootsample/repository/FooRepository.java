package com.example.hrkm.springbootsample.repository;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class FooRepository {

  private final String githubReposiory = "https://github.com/h-r-k-matsumoto/k8s-jmc-sample.git";

  private Logger log = LoggerFactory.getLogger(getClass());

  public List<String> search(String query) {
    Path homePath = this.initRepository();
    List<String> result = new ArrayList<>();
    this.grep(homePath, homePath, query.toUpperCase(), result);
    return result;
  }

  private void grep(Path home, Path path, String query, List<String> result) {
    log.info("grep {}", path);

    try {
      Files.list(path).forEach((f) -> {
        if (!Files.exists(f)) {
          return;
        } else if (Files.isDirectory(f)) {
          grep(home, f, query, result);
        } else {
          String filename = f.getFileName().toString();
          if (filename.toUpperCase().indexOf(query) != -1) {
            result.add(home.relativize(f).toString());
          }
        }
      });
    } catch (Exception ex) {
      throw new RuntimeException(ex);
    }
  }

  private Path initRepository() {
    log.info("init repository start");
    try {
      Path gitHomePath = Files.createTempDirectory("git");
      Path repository = gitHomePath.resolve("k8s-jmc-sample");
      Path gitFile = repository.resolve(".git");

      try (Git git = new Git(new FileRepository(gitFile.toFile()));) {
        Git.cloneRepository()//
            .setDirectory(repository.toFile())//
            .setURI(githubReposiory)//
            .setBranch("master").call();
      }
      log.info("init repository end");

      return repository;
    } catch (Exception ex) {
      throw new RuntimeException(ex);
    }
  }
}
