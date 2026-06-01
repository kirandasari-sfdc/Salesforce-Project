public with sharing class pdfGenerators {
    
    @AuraEnabled
    public static Attachment generatePdf(Id recordId,String htmlData){
        PageReference page = page.invoicePdfRender;
        page.getParameters().put('pdfText', htmlData);

        Contact con = new Contact(Id=recordId);
        Attachment attObj = new Attachment();
        attObj.Name='invoice.pdf';
        attObj.Body=page.getContentAsPDF();
        attObj.ParentId=con.Id;
        attObj.IsPrivate=false;
        insert attObj;
        return attObj;
    }

}