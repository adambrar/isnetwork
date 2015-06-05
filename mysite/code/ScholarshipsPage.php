<?php 
 
class ScholarshipsPage extends Page 
{
     private static $db = array(
         'Message' => 'Text',
         'NumberShown' => 'Varchar(2)'
     );
    
    private static $defaults = array(
        'menuStudent' => '1'
    );
        
    
    public function getCMSFields() {
        $fields = parent::getCMSFields();
              
        $fields->addFieldToTab("Root.Main", new TextareaField('Message', 'Message'), 'Content');      
        $fields->addFieldToTab("Root.Main", new NumericField('NumberShown', 'Number of Scholarships shown(max 99)'), 'Content');
        
        $fields->removeByName("Content");

        return $fields;
    }
}
 
class ScholarshipsPage_Controller extends Page_Controller 
{
    function init() {
        parent::init();
        
        if(!Member::currentUserID() || !Member::currentUser()->isStudent()) {
            Security::permissionFailure(null, 'You need to be logged into a student profile to view this content.');
        }
    }
    
    public function getScholarships() {
        return Scholarship::get();
    }
}