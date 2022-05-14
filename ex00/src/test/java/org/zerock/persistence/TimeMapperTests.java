package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.TimeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java설정을 이용하는 경우
//@ContextConfiguration(classes= {RootConfig.class})

@Log4j
public class TimeMapperTests {
	
	@Autowired
	private TimeMapper timeMapper;
	
	@Test
	public void testTime1() {
		
		log.info(timeMapper.getTime());
	}
}
