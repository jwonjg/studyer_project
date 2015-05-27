package com.sds.icto.studyer.controller;

import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sds.icto.studyer.domain.BoardVo;
import com.sds.icto.studyer.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

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
			@RequestParam("file") MultipartFile file) {

		
		vo.setFile_url(file.getOriginalFilename());

		int seqno = boardService.boardInsert(vo, subject, teacher, place, name);

		String fileOriginalName = file.getOriginalFilename();
		String extName = fileOriginalName.substring(
				fileOriginalName.lastIndexOf(".") + 1,
				fileOriginalName.length());
		String fileName = file.getName();
		Long size = file.getSize();

		String saveFileName = "";
		saveFileName = seqno + ("." + extName);

		writeFile(file, "c:\\document", saveFileName);

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

	@RequestMapping(value = "/detail")
	public String detail() {
		return "board/detail";
	}

}
