package com.odoo.combat.api.v1.dtos;

import java.util.ArrayList;

import lombok.Data;

@Data
public class VolumeInfo {
	
	   	private String title;
	    private String subtitle;
	    private ArrayList<String> authors;
	    private String publisher;
	    private String publishedDate;
	    private String description;
	    private ArrayList<IndustryIdentifier> industryIdentifiers;
	    private ReadingModes readingModes;
	    private int pageCount;
	    private String printType;
	    private String maturityRating;
	    private boolean allowAnonLogging;
	    private String contentVersion;
	    private PanelizationSummary panelizationSummary;
	    private ImageLinks imageLinks;
	    private String language;
	    private String previewLink;
	    private String infoLink;
	    private String canonicalVolumeLink;
}
