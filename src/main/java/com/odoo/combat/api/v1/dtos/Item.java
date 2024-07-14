package com.odoo.combat.api.v1.dtos;

import lombok.Data;

@Data
public class Item {
	 private String kind;
	   private String id;
	   private String etag;
	   private String selfLink;
	   private VolumeInfo volumeInfo;
	   private SaleInfo saleInfo;
	   private AccessInfo accessInfo;
	   private SearchInfo searchInfo;
}
