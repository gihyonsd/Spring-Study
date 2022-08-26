package hello.hellospring.repository;

import hello.hellospring.domain.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {
    Member save(Member member);
    Optional<Member> findById(Long id); //아이디 찾기
    Optional<Member> findByName(String name); //이름 찾기
    List<Member> findAll(); //전부 다 찾기
}
