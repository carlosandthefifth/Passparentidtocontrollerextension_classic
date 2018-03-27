public with sharing class XProductHelperClass {

	public ID URL_ID {get; set;}

 //   private ApexPages.StandardController stdctrl;
    private Schema.SObjectType caseType = Schema.getGlobalDescribe().get('case');
    private Schema.SObjectType bookType = Schema.getGlobalDescribe().get('gdansf14383017__Book__c');

	public XProductHelperClass (ApexPages.StandardController stdController) {
//		this.stdctrl = stdController;
		String str = System.currentPageReference().getParameters().get('retURL').substring(1,16); // get the parent ID from URL
		URL_Id = (Id)str;
	}
	
	public PageReference save() {
		system.debug('2');
		system.debug('id: ' + URL_ID);
		system.debug('URL_ID.getSobjectType(): ' + URL_ID.getSobjectType());
     	x_Product__c x_Product;
     	if (URL_ID.getSobjectType() == caseType)
 			x_Product = new x_Product__c(case__c = URL_ID);
		else if (URL_ID.getSobjectType() == bookType)
 			x_Product = new x_Product__c(book__c = URL_ID);
		insert x_Product;
		return new ApexPages.StandardController(x_Product).view();
	}
}