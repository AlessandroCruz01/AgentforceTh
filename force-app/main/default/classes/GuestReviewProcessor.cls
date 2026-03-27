/**
 * @description       : This class processes guest reviews submitted via Experience Cloud.
 * @last modified on  : 01-29-2026
 * @last modified by  : Alessandro Souza
**/
public with sharing class GuestReviewProcessor {

    public class GuestReviewRequest {

        @InvocableVariable(required=true description='The contact providing the review' label='Contact')
        public Contact contact;

        @InvocableVariable(required=true description='The experience being reviewed' label='Experience')
        public Experience__c experience;

        @InvocableVariable(required=true description='The review comments' label='Review ')
        public String review;

        @InvocableVariable(required=true description='The rating given by the guest' label='Rating')
        public String rating;
    }

    public class GuestReviewResponse {

        @InvocableVariable(label='status' description='The status message of the review processing')
        public String message;
    }

    @InvocableMethod(label='Process Guest Reviews' description='Processes guest reviews submitted via Experience Cloud')
    public static List<GuestReviewResponse> processReviews(
        List<GuestReviewRequest> requests
    ) {
        List<GuestReviewResponse> responses = new List<GuestReviewResponse>();

        for (GuestReviewRequest req : requests) {
            GuestReviewResponse res = new GuestReviewResponse();
            try {
                Guest_Review__c gr = new Guest_Review__c();
                gr.Contact__c    = req.contact.Id;
                gr.Experience__c = req.experience.Id;
                gr.Comments__c   = req.review;
                gr.Rating__c     = req.rating;

                insert gr;

                res.message = 'Guest review processed successfully';
            } catch (Exception e) {
                res.message = 'There was a problem processing your review';
            }
            responses.add(res);
        }
        return responses;
    }
}