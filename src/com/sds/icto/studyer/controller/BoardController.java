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

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute BoardVo vo,
			@RequestParam String subject, @RequestParam String teacher,
			@RequestParam String place, @RequestParam String name,
			@RequestParam("file") MultipartFile file,
			HttpSession session) {

		
		vo.setFile_url(file.getOriginalFilename());

		int seqno = boardService.boardInsert(vo, subject, teacher, place, name);
		
		boardService.editInsert(new EditVo(seqno, 0, vo.getContent().length(), vo.getContent(), ((MemberVo)session.getAttribute("authUser")).getName()));
		
		String fileOriginalName = file.getOriginalFilename();
		String extName = fileOriginalName.substring(
				fileOriginalName.lastIndexOf(".") + 1,
				fileOriginalName.length());
		String fileName = file.getName();
		Long size = file.getSize();

		String saveFileName = "";
		saveFileName = seqno + ("." + extName);

		writeFile(file, "c:\\studyer_file", saveFileName);

		return "board/list";
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
			@RequestParam String originExt){
		
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
		
		return "board/detail";
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
	public String view(@PathVariable int no, @RequestParam int good){
		
		boardService.boardLike(no);
		return "board/detail";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public String search(ClassVo vo, Model model) {
		model.addAttribute("list", boardService.boardClassList(vo));
		return "board/list";
	}
	
	@RequestMapping(value={"/delete/{no}"}, method=RequestMethod.GET)
	public String delete(@PathVariable int no){
		boardService.boardDelete(no);
		return "redirect:/board/search";
	}

	


}
