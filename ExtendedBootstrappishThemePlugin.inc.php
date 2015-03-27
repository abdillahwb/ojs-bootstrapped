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
import('lib.pkp.classes.user.PKPUser');

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
		
		// Add viewport
		$viewport = ' <meta name="viewport" content="width=device-width, initial-scale=1">';

		// Add Font Awesome
		$fontAwesome = ' <link rel="stylesheet" id="font-awesome-css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" type="text/css" media="screen">';

		// Add in jQuery
		$jQuery = '	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>';

		// Selctivizr for IE Pseudo classes
		$selctivizr = '<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/mootools/1.5.1/mootools-yui-compressed.js"></script>
						<!--[if (gte IE 6)&(lte IE 8)]>
  							<script type="text/javascript" src="/js/selectivizr-min.js"></script>
						<![endif]-->';

		$additionalHeadData = $templateMgr->get_template_vars('additionalHeadData');
		$templateMgr->assign('additionalHeadData', $additionalHeadData."\n".$jQuery."\n".$viewport."\n".$fontAwesome."\n".$selctivizr);
		// Add Scroll2Top JS
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/scroll2top.js');

		// Add Modernizr JS
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/modernizr.custom.69748.js');

		// Add in Bootstrap JS
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/bootstrap.min.js');

		// Add Custom JS
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/custom.js');

		if (($stylesheetFilename = $this->getStylesheetFilename()) != null) {
			$path = Request::getBaseUrl() . '/' . $this->getPluginPath() . '/compass/stylesheets/' . $stylesheetFilename .'?bootstrappish';
			$templateMgr->addStyleSheet($path);
		
		
		}
		$requestedPage = PKPRequest::getRequestedPage();
		if ($requestedPage == 'article') {
			$path = Request::getBaseUrl() . '/' . $this->getPluginPath() . '/compass/stylesheets/article.css'.'?bootstrappish';
			$templateMgr->addStyleSheet($path);
		}

	}
	
}

?>