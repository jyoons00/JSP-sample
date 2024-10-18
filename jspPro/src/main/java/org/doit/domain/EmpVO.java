package org.doit.domain;

import java.time.LocalDateTime;
import java.util.Date;

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
public class EmpVO {

	private int empno;
	private String ename;
	private String job;
	private int mgr;
//	private LocalDateTime hiredate;
	private Date hiredate; // 자바 유틸로 설정
	private double sal; 
	private double comm;
	private int deptno;

} // class










