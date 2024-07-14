package com.odoo.combat.api.v1.dtos;

import lombok.Data;

@Data
public class AccessInfo {
    public String country;
    public String viewability;
    public boolean embeddable;
    public boolean publicDomain;
    public String textToSpeechPermission;
    public Boolean isEpubAvailable;
    public Boolean isPdfAvailable;
    public String webReaderLink;
    public String accessViewStatus;
    public boolean quoteSharingAllowed;
}

