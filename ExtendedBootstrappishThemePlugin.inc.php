<?php

/**
 * @file ExtendedBootstrappishThemePlugin.inc.php
 *
 * Copyright (c) 2013 Christopher Anderton
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class ExtendedBootstrappishThemePlugin
 * @ingroup plugins_themes_extendedbootstrappish
 *
 * @brief Extension of "Bootstrappish" theme plugin
 */

//$Id$

import('classes.plugins.ThemePlugin');

class ExtendedBootstrappishThemePlugin extends ThemePlugin {
	
	/**
	 * @see PKPPlugin::register($category, $path)
	 */
	function register($category, $path) {
		HookRegistry::register ('TemplateManager::display', array(&$this, 'callbackDisplay'));
		return parent::register($category, $path);
	
	}
	
	/**
	 * Template manager display hook callback to register smarty filters.
	 * @param $hookName string
	 * @param $args array
	 * @return boolean
	 */

	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'ExtendedBootstrappishThemePlugin';
	}

	function getDisplayName() {
		return 'Extension of Bootstrappish Theme';
	}

	function getDescription() {
		return 'Extends "Bootstrappish" theme to further include Bootstrap elements';
	}

	function getStylesheetFilename() {
		return 'screen.css';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}

	/**
	 * Activate the theme.
	 */
	function activate(&$templateMgr) {

		// Resets the template directory to the files in this directory -- Credit to https://github.com/cu-library/OJS-Modern-Theme for the fix/redirection

		$templateMgr->template_dir[0] = Core::getBaseDir() . DIRECTORY_SEPARATOR . 'plugins' . DIRECTORY_SEPARATOR . 'themes' . DIRECTORY_SEPARATOR . 'extendedbootstrappish' . DIRECTORY_SEPARATOR . 'templates';
		$templateMgr->compile_id = 'extendedbootstrappish';

		// Add in jQuery from CMS
		$jQuery = '	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>';
		$additionalHeadData = $templateMgr->get_template_vars('additionalHeadData');
		$templateMgr->assign('additionalHeadData', $additionalHeadData."\n".$jQuery);

		// Add in Bootstrap JS
		$templateMgr->addJavaScript('plugins/themes/extendedbootstrappish/js/bootstrap.min.js');
		
		if (($stylesheetFilename = $this->getStylesheetFilename()) != null) {
			$path = Request::getBaseUrl() . '/' . $this->getPluginPath() . '/compass/stylesheets/' . $stylesheetFilename .'?bootstrappish';
			$templateMgr->addStyleSheet($path);
			
			
		}

	}
	
}

?>
