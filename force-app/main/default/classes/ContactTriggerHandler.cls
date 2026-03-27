public with sharing class ContactTriggerHandler {
    public static void processCampaignMembers(){
       Map<Id, Contact> recurringCampaignParticipant = new Map<Id, Contact>();
        
        for(sObject tempContact:trigger.new){
            Contact newContact = (Contact)tempContact;
            Contact oldContact = trigger.oldMap == null ? null : (Contact)trigger.oldMap.get(newContact.Id);
          
          recurringCampaignParticipant.put(newContact.Id, newContact);
          
        }
        CampaignMemberController.createCampaignMemberforRelatedCampaigns(recurringCampaignParticipant);
    }
}