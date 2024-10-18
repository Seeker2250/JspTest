package org.doit.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.Builder;
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
	private int cnt;//사원 수
}
/*
 * eclipse���� help  -> About Eclipse IDE Ȯ��
 * �������� build path���� �����ϸ� �Ǵµ� �������� WEB-INF ���� ���� lib ���� �� �ȿ� �� ��������� ��
 * */ 