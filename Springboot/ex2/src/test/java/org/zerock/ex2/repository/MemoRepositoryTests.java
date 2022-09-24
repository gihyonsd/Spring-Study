package org.zerock.ex2.repository;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.zerock.ex2.entity.Memo;


import javax.swing.border.MatteBorder;
import java.util.stream.IntStream;

@SpringBootTest
public class MemoRepositoryTests {

    @Autowired
    MemoRepository memoRepository;

    @Test
    public void testInsert() {
        System.out.println(memoRepository.getClass().getName());
    }

    @Test
    public void testInsertDummies(){
        IntStream.rangeClosed(1,100).forEach(i -> {
            Memo memo = Memo.builder().memoText("memo"+i).build();
            memoRepository.save(memo);
        });
    }

    @Test
    public void testUpdate() {
        Memo memo = Memo.builder().mno(1L).memoText("update............1").build();
        System.out.println("1====================");
        memoRepository.save(memo);
        System.out.println("2====================");
    }

    @Test
    public void testDelete() {

        Long mno = 100L;

        memoRepository.deleteById(mno);
    }

    @Test
    public void testPaging() {

        Sort sort = Sort.by("mno").descending();

        Pageable pageable = PageRequest.of(0, 10, sort);

        Page<Memo> result = memoRepository.findAll(pageable);

        System.out.println("-------------------");

    }
}
