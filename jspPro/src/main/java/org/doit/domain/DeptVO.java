package org.doit.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder 
public class DeptVO {
	private int deptno;
	private String dname;
	private String loc;
	private int cnt;//사원수
}
/*
 * eclipse에서 help  -> About Eclipse IDE 확인
 * 기존에는 build path가서 설정하면 되는데 웹에서는 WEB-INF 파일 보면 lib 보면 그 안에 다 집어넣으면 돼
 * */ 