<?php

class HighSchool extends DataObject {
    
    private static $db = array(
        'Title' => 'Varchar(100)',
    );
    
    private static $has_many = array(
        'Student' => 'Member'
    );
    
    public static function getHighSchoolOptions()
    {
        if($highSchools = DataObject::get("HighSchool"))
        {
            return $highSchools->map('ID', 'Title', 'Please Select');
        } else {
            return array('No High Schools');
        }
    }
    
}