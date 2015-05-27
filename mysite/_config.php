<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	"type" => 'MySQLDatabase',
	"server" => 'localhost',
	"username" => 'root',
	"password" => '',
	"database" => 'SS_mysite',
	"path" => '',
);

// Set the site locale
i18n::set_locale('en_US');

// Remove when live
Director::set_environment_type('dev');
error_reporting(E_ALL);

Member::set_unique_identifier_field('Email');

HTMLEditorConfig::get('cms')->setOption('valid_elements', '*[*]');
HTMLEditorConfig::get('cms')->setOption('invalid_elements', 'script');

Page::set_restricted_pagetypes(array(
    'ErrorPage',
    'VirtualPage',
    'RedirectorPage'
));

Object::useCustomClass('MemberLoginForm', 'GroupRedirectLoginForm');

Object::add_extension('Member', 'MemberDecorator');

Object::add_extension('BlogHolder', 'BlogHolderDecorator');
Object::add_extension('BlogHolder_Controller', 'BlogHolder_ControllerDecorator');

Object::add_extension('BlogEntry', 'BlogEntryDecorator');

Object::add_extension('BlogTree', 'BlogTreeDecorator');

Object::add_extension('CommentingController', 'CommentingControllerDecorator');

Object::add_extension('ForumHolder', 'ForumHolderDecorator');

Object::add_extension('MemberProfilePage_Controller', 'MemberProfilePage_ControllerDecorator');

Object::add_extension('MemberProfileViewer', 'MemberProfileViewerDecorator');

SiteTree::add_extension('Translatable');