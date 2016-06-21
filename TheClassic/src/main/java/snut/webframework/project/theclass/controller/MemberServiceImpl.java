package snut.webframework.project.theclass.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
     
    @Resource(name="MemberDao")
    private MemberDao memberDao;
 
    @Override
    public List<Member> getMemberLists() {
        return memberDao.getMemberLists();
    }

 
}
