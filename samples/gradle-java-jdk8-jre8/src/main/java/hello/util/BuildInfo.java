package hello.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import javax.annotation.PostConstruct;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="build")
public class BuildInfo {

  private String commit;

  private String branch;

  private String time;

  private String version;

  public void setCommit(String commit) {
    this.commit = commit;
  }

  public void setBranch(String branch) {
    this.branch = branch;
  }

  public void setTime(String time) {
    this.time = time;
  }

  public void setVersion(String version) {
    this.version = version;
  }

  @PostConstruct
  public void initIt() throws Exception {
    System.out.println("INITIALIZED : " + this);
  }

  @Override
  public String toString() {
    return "commit=" + commit + ";branch=" + branch + ";time=" + time + ";version=" + version;
  }
}
