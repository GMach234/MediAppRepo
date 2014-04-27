package com.mholmes.mediapprest.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mholmes.mediapprest.domain.Images;
import com.mholmes.mediapprest.domain.Note;
import com.mholmes.mediapprest.service.MobileService;

@Controller
public class NotesController {

	private static ApplicationContext services = new ClassPathXmlApplicationContext("dataAccess.xml");	
	private static MobileService mobileService = (MobileService)services.getBean("MobileService");
	
	//Take Path Variable and retrieve list of Note objects to return as JSON
	@RequestMapping(value = "/getNotes/{patientId}", method = RequestMethod.GET)
	@ResponseBody
	public List<Note> getNotes(@PathVariable("patientId") int id) {
				 
		List<Note> notes = mobileService.getNotes(id);
		return notes;
	}
	
	//Accept JSON object from application as Note Object and submit to the DB
	@RequestMapping(value = "/submitNote", method = RequestMethod.POST)
	@ResponseBody
	public void submitNote(@RequestBody Note note) {
				 
		int patientId = note.getPatientId();
		String n = note.getNote();
		int userId = note.getUserId();
		
		mobileService.submitNote(patientId, n, userId);
	}
	
	//Accept list of Strings as JSON containing base64 encoded data and submit to the DB
	@RequestMapping(value = "/submitImages", method = RequestMethod.POST)
	@ResponseBody
	public void submitImages(@RequestBody Images images) {
				
		List<String> imageData = images.getImageData();
		mobileService.submitImage(imageData);
	}
	
	//Take Path Variable and retrieve list of Strings representing images to return as JSON
	@RequestMapping(value = "/getImages/{noteId}", method = RequestMethod.GET)
	@ResponseBody
	public List<String> getImages(@PathVariable("noteId") int id) {
		
		List<String> images = mobileService.getImages(id);
		return images;
	}
	
	//Take Path Variable and remove Note Data and Image Data on the DB
	@RequestMapping(value = "/removeNote/{noteId}", method = RequestMethod.GET)
	@ResponseBody
	public void removeNote(@PathVariable("noteId") int id) {
		
		mobileService.removeNote(id);
	}
	
}
