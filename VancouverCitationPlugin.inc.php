<?php

/**
 * @file VancouverCitationPlugin.inc.php
 *
 * Copyright (c) 2008 Richard Gonz�lez Alberto
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class VancouverCitationPlugin
 * @ingroup plugins_citationFormats_Vancouver
 *
 * @brief Vancouver citation format plugin
 */
 
import('classes.plugins.CitationPlugin');

class VancouverCitationPlugin extends CitationPlugin {
	function register($category, $path) {
		$success = parent::register($category, $path);
		$this->addLocaleData();
		return $success;
	}

	function getName() {
		return 'VancouverCitationPlugin';
	}

	function getDisplayName() {
		return Locale::translate('plugins.citationFormats.vancouver.displayName');
	}

	function getCitationFormatName() {
		return Locale::translate('plugins.citationFormats.vancouver.citationFormatName');
	}

	function getDescription() {
		return Locale::translate('plugins.citationFormats.vancouver.description');
	}

	 
	
	/**
	 * Heuristic to clean up author last names (turn 2nd last name into an initial)
	 * 
	 */
	function getAuthorFormatedName($firstName, $lastName){
		
		return str_replace(' ', '-', $lastName). ' ' . String::strtoupper(String::substr($firstName, 0, 1));
	}

	
}

?>
