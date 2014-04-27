package com.mholmes.mediapprest.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mholmes.mediapprest.domain.Note;

public class NoteMapper implements RowMapper<Note> {

	@Override
	public Note mapRow(ResultSet rs, int rowNum) throws SQLException {
		Note note = new Note();
		note.setNoteId(rs.getInt("note_id"));
		note.setTime(rs.getString("time"));
		note.setPatientId(rs.getInt("patient_id"));
		note.setNote(rs.getString("note"));
		note.setUserId(rs.getInt("user_id"));
		return note;
	}

}
