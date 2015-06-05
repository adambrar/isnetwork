<?php
class MemberDecorator extends DataExtension {
    
    private static $db = array(
        'MemberType' => "Enum('Student, University, Agent')",
        'MiddleName' => 'Varchar(50)',
        'DateOfBirth' => 'Date',
        'Telephone' => 'Varchar(20)',
        'StreetAddress' => 'Varchar(100)',
        'PostalCode' => 'Varchar(10)',
        'Agency' => 'Varchar(100)',
        'HSGraduation' => 'Date',
        'UniversityGraduation' => 'Date',
        'ContactFirstName' => 'Varchar(100)',
        'ContactSurname' => 'Varchar(100)',
        'ContactTelephone' => 'Varchar(100)',
        'BusinessWebsite' => 'Varchar(100)',
        'BusinessName' => 'Varchar(100)',
        'BusinessContact' => 'Varchar(100)',
        'BusinessTelephone' => 'Varchar(20)',
        'BusinessRegistrationNumber' => 'Varchar(30)'
    );
    
    private static $has_one = array(
        'HighSchool' => 'HighSchool',
        'University' => 'University',
        'PartnersProfile' => 'PartnersProfile',
        'ProfilePicture' => 'Image',
        'Nationality' => 'Country',
        'CurrentCountry' => 'Country',
        'ContactCountry' => 'Country',
        'BusinessCountry' => 'Country',
        'City' => 'City'
    );
    
    private static $many_many = array(
        'Programs' => 'Program'
    );
    
    private static $searchable_fields = array(
        'BusinessName' => 'BusinessName',
        'HighSchoolID' => 'HighSchool',
        'UniversityID' => 'University'
    );
    
    public function getProfilePageLink($id) {
        $member = Member::get()->ByID($id);
        if(!$member || !$member->isStudent())
            return false;
        
        return MemberProfilePage::get()->filter(array(
            'AllowProfileViewing' => '1',
            'AllowRegistration' => '0'
        ))->First()->Link() . 'show/' . $id;
    }
    
    public function getProfilePictureLink($id) {
        $member = Member::get()->ByID($id);
        if(!$member || !$member->isStudent($member))
            return false;
        
        if($member->ProfilePictureID) {
            return File::get()->filter(array(
            'ClassName' => 'Image',
            'ID'        => $member->ProfilePictureID
        ))->First()->Link();
        } else {
            return Director::baseURL() . 'assets/Uploads/default.jpg';
        }
    }
    
    public function isStudent(Member $member = null) {
        if(!$member) {
            return $this->owner->MemberType == "Student";
        } else {
            return $member->MemberType == "Student";
        }
    }
    
    public function isAgent(Member $member = null) {
        if(!$member) {
            return $this->owner->MemberType == "Agent";
        } else {
            return $member->MemberType == "Agent";
        }    }
    
    public function isUniversity(Member $member = null) {
        if(!$member) {
            return $this->owner->MemberType == "University";
        } else {
            return $member->MemberType == "University";
        }
    }
    
    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldToTab('Root.Main', DropdownField::create('MemberType', 'Member Type', singleton('Member')->dbObject('MemberType')->enumValues())->setEmptyString('Select Member Type'), 'FirstName');

        $fields->removeByName('FirstName');
        $fields->removeByName('Surname');
        $fields->removeByName('Country');
        $fields->removeByName('City');
        
        $this->addStudentFields($fields);
        $this->addBusinessFields($fields);
        

        $fields->removeByName('FirstNamePublic');
        $fields->removeByName('SurnamePublic');
        $fields->removeByName('OccupationPublic');
        $fields->removeByName('CompanyPublic');
        $fields->removeByName('CityPublic');
        $fields->removeByName('CountryPublic');
        $fields->removeByName('EmailPublic');
        $fields->removeByName('Occupation');
        $fields->removeByName('Company');
        $fields->removeByName('Nickname');
        $fields->removeByName('Signature');
    }
    
    function Link() {
        if($ProfilePage = DataObject::get_one('MemberProfilePage')->filter('AllowProfileEditing', '1'))
        {
           return $ProfilePage->Link();
        }
    }
    
    private function addStudentFields(FieldList $fields) {
         $fields->addFieldToTab('Root.Profile', new TextField('FirstName', 'First Name'));
        $fields->addFieldToTab('Root.Profile', new TextField('MiddleName', 'Middle Name'));
        $fields->addFieldToTab('Root.Profile', new TextField('Surname', 'Surname'));

        $fields->addFieldToTab('Root.Profile', new DateField('DateOfBirth', 'Date of Birth'));      
        $fields->addFieldToTab('Root.Profile', DropdownField::create('NationalityID', 'Nationality', Country::getCountryOptions())->setEmptyString('Select a country'));
        $fields->addFieldToTab('Root.Profile', new TextField('Telephone', 'Telephone Number'));         
        $fields->addFieldToTab('Root.Profile', new TextField('StreetAddress', 'Street Address'));         
        $fields->addFieldToTab('Root.Profile', new DropdownField('CityID', 'City', City::getCityOptions()));         
        $fields->addFieldToTab('Root.Profile', DropdownField::create('CurrentCountryID', 'Current Country', Country::getCountryOptions())->setEmptyString('Select a country'));         
        $fields->addFieldToTab('Root.Profile', new TextField('PostalCode', 'Postal Code'));
        $fields->addFieldToTab('Root.Education', new DropdownField('HighSchoolID', 'High School', HighSchool::getHighSchoolOptions()));         
        $fields->addFieldToTab('Root.Education', new DateField('HSGraduation', 'Graduation'));        
        $fields->addFieldToTab('Root.Education', new DropdownField('UniversityID', 'University', University::getUniversityOptions())); 
        $fields->addFieldToTab('Root.Education', new DateField('UniversityGraduation', 'Graduation'));         
        $fields->addFieldToTab('Root.Education', new TextField('Agency', 'Agency'));         

        $fields->addFieldToTab('Root.EmergencyContant', new TextField('ContactFirstName', 'Contact First Name'));
        $fields->addFieldToTab('Root.EmergencyContant', new TextField('ContactSurname', 'Contact Surname'));
        $fields->addFieldToTab('Root.EmergencyContant', new TextField('ContactTelephone', 'Contact Telephone'));
        $fields->addFieldToTab('Root.EmergencyContant', DropdownField::create('ContactCountryID', 'Contact Country', Country::getCountryOptions())->setEmptyString('Select a country'));
        $fields->addFieldToTab('Root.EmergencyContant', new EmailField('ContactEmail', 'Contact Email'));
    }
    
    private function addBusinessFields(FieldList $fields) {
        $fields->addFieldToTab('Root.Partner', new TextField('BusinessName', 'Business Name'));         
        $fields->addFieldToTab('Root.Partner', new TextField('BusinessWebsite', 'Website'));         
        $fields->addFieldToTab('Root.Partner', new TextField('BusinessContact', 'Contact Name'));         
        $fields->addFieldToTab('Root.Partner', new TextField('BusinessTelephone', 'Contact Telephone'));         
        $fields->addFieldToTab('Root.Partner', DropdownField::create('BusinessCountryID', 'Country of Registration', Country::getCountryOptions())->setEmptyString('Select a country'));
        $fields->addFieldToTab('Root.Partner', new TextField('BusinessRegistrationNumber', 'Business Registration Number'));         
        $fields->addFieldToTab('Root.Partner', new HiddenField('PartnersProfileID', 'Partners Profile ID'));         
    }
    
}