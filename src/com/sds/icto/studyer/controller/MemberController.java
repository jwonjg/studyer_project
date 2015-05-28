package com.sds.icto.studyer.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.tomcat.jni.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sds.icto.studyer.domain.MemberVo;
import com.sds.icto.studyer.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Log LOG = LogFactory.getLog( MemberController.class );

	@Autowired
	MemberService memberService;

	@RequestMapping("/checkEmail")
	@ResponseBody
	public Object checkEmail(String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(memberService.checkEmail(email)) {
			map.put("result", true );
			map.put("data", "이미 사용 중인 Email입니다." );
		} else  {
			map.put("result", false );
			map.put("data", "Email을 사용할 수 있습니다." );	
		}
		
		return map;
	}
	

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVo vo,  @RequestParam("file")MultipartFile file ) {
		
		vo.setPhoto(file.getOriginalFilename());
		int seqno= memberService.joinUser(vo);
	
		//LOG.debug( " ######## deptNo : " + deptNo );

        String fileOriginalName = file.getOriginalFilename();
        String extName = fileOriginalName.substring( fileOriginalName.lastIndexOf(".") + 1, fileOriginalName.length() );
        String fileName = file.getName();
        Long size = file.getSize();
        
        
        String saveFileName = "";
        saveFileName = seqno+( "." + extName );

        writeFile( file, "c:\\studyer_image", saveFileName );
		
		return "redirect:/index";
	}
	
	private void writeFile( MultipartFile file, String path, String fileName ) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream( path + "\\" + fileName );
			fos.write(fileData);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}
	

	@RequestMapping(value = "/signIn")
	@ResponseBody
	public Object login(String email, String password,  HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVo memberVo = memberService.authUser(email, password);
		
		if (memberService.authUser(email, password) == null) {
			map.put("result","fail");
		}else {
			map.put("result","success");
			session.setAttribute("authUser",memberVo);
		}
		return map;
	}
	
	@RequestMapping(value = "/userinfo", method = RequestMethod.POST)
	public String update(@ModelAttribute MemberVo vo, HttpSession session) {
		memberService.UpdateUinfo(vo);
		MemberVo memberVo = memberService.authUser(vo.getEmail(), vo.getPassword());
		session.setAttribute("authUser", memberVo);
		return "redirect:/index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.removeAttribute("authUser");
		session.invalidate();

		return "redirect:/index";
	}
	
	

		
	

}
