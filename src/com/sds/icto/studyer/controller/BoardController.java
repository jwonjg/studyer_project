package com.sds.icto.studyer.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;




import com.sds.icto.studyer.domain.*;
import com.sds.icto.studyer.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Log LOG = LogFactory.getLog( MemberController.class );
	
	@Autowired
	BoardService boardService;

	@RequestMapping(value = { "", "/write" }, method = RequestMethod.GET)
	public String index() {
		return "board/write";
	}
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", boardService.boardClassList(new ClassVo()));
		return "board/list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute BoardVo vo,
			@RequestParam String subject, @RequestParam String teacher,
			@RequestParam String place, @RequestParam String name,
			@RequestParam("file") MultipartFile file,
			String member_name) {
		
		vo.setFile_url(file.getOriginalFilename());

		int seqno = boardService.boardInsert(vo, subject, teacher, place, name);
		
		boardService.editInsert(new EditVo(seqno, 0, vo.getContent().length(), vo.getContent(), member_name));
		
		String fileOriginalName = file.getOriginalFilename();
		String extName = fileOriginalName.substring(
				fileOriginalName.lastIndexOf(".") + 1,
				fileOriginalName.length());
		String fileName = file.getName();
		Long size = file.getSize();

		String saveFileName = "";
		saveFileName = seqno + ("." + extName);

		writeFile(file, "c:\\studyer_file", saveFileName);

		return "redirect:/board/detail/"+seqno;
	}

	private void writeFile(MultipartFile file, String path, String fileName) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream(path + "\\" + fileName);
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
	
	@RequestMapping(value={"/update/{no}"}, method=RequestMethod.GET)
	public String modifyForm(@PathVariable int no, Model model){
		
		model.addAttribute("no",no);
		BoardVo vo = boardService.boardDetail(no);
		model.addAttribute("vo",vo);
		ClassVo vo2 = boardService.boardClassDetail(no);
		model.addAttribute("c_vo",vo2);
		return "board/update";
	}
		
	@RequestMapping(value={"/update"}, method=RequestMethod.POST)
	public String modify(@ModelAttribute BoardVo vo, Model model, @RequestParam("file") MultipartFile file,
			String originExt, String before_content, String member_name){
		
		String deleteFile = String.valueOf(vo.getNo());
		
		//String saveDir = "studyer_file";
		//String saveFullDir = request.getServletContext().getRealPath(saveDir);
		String saveFullDir = "c:\\studyer_file";
		if(deleteFile != null && !deleteFile.equals("")) new File(saveFullDir+"/"+deleteFile+"."+originExt).delete();
		
		vo.setFile_url(file.getOriginalFilename());
		int seqno = vo.getNo();
				
		String fileOriginalName = file.getOriginalFilename();
		String extName = fileOriginalName.substring(
				fileOriginalName.lastIndexOf(".") + 1,
				fileOriginalName.length());
		String fileName = file.getName();
		Long size = file.getSize();

		String saveFileName = "";
		saveFileName = seqno + ("." + extName);

		writeFile(file, "c:\\studyer_file", saveFileName);
		
		boardService.boardUpdate(vo);
		
		BoardVo vo3 = boardService.boardDetail(vo.getNo());
		model.addAttribute("vo",vo3);
		ClassVo vo4 = boardService.boardClassDetail(vo.getNo());
		model.addAttribute("c_vo",vo4);

//		String[] update = vo.getContent().split("\\s+\n");
//		String[] before = before_content.split("\\s+\n");
		
//		int first = 0;
//		int last = before_content.length();
//		if(vo.getContent().length()>=before_content.length()){
//			for (int i = 0; i < vo.getContent().length(); i++) {
//				if(vo.getContent().charAt(i)!=before_content.charAt(i)) {
//					first = i;
//					break;
//				}
//			}
//			
//			for (int i = 0; i < vo.getContent().length(); i++) {
//				if(vo.getContent().charAt(i)!=before_content.charAt(i)) {
//					first = i;
//					break;
//				}
//			}
//			
//			first = vo.getContent().compareTo(before_content);
//			last = vo.getContent().length() - new StringBuilder(vo.getContent()).reverse().toString().compareTo(new StringBuilder(before_content).reverse().toString()); 
//		}else{
//			first = before_content.compareTo(vo.getContent());
//			last = before_content.length() - new StringBuilder(before_content).reverse().toString().compareTo(new StringBuilder(vo.getContent()).reverse().toString()); 
//		}
//		System.out.println(first);
//		System.out.println(last);
//		System.out.println(member_name);
//		boardService.editInsert(new EditVo(seqno, first, last, vo.getContent().substring(first, last), member_name));
		
		return "redirect:/board/detail/"+seqno;
	}

	@RequestMapping(value = {"/detail/{no}"}, method=RequestMethod.GET)
	public String detail(@PathVariable int no, Model model) {
		model.addAttribute("no",no);
		BoardVo vo2 = boardService.boardDetail(no);
		model.addAttribute("vo2",vo2);
		
		ClassVo vo = boardService.boardClassDetail(no);
		model.addAttribute("c_vo",vo);
		
		return "board/detail";
	}
	
	@RequestMapping(value={"/like/{no}"}, method=RequestMethod.GET)
	public String like(@PathVariable int no){
		boardService.boardLike(no);
		return "redirect:/board/detail/"+no;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(ClassVo vo, Model model) {
		model.addAttribute("list", boardService.boardClassList(vo));
		return "board/list";
	}
	
	@RequestMapping(value={"/delete/{no}"}, method=RequestMethod.GET)
	public String delete(@PathVariable int no){
		boardService.boardDelete(no);
		return "redirect:/board/list";
	}

	


}
