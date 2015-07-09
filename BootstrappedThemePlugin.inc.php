<?php

/**
 * @file BootstrappedThemePlugin.inc.php
 *
 * Copyright (c) 2013 Christopher Anderton
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class BootstrappedThemePlugin
 * @ingroup plugins_themes_bootstrapped
 *
 * @brief Extension of "Bootstrappish" theme plugin
 */

//$Id$

import('classes.plugins.ThemePlugin');
import('lib.pkp.classes.user.PKPUser');

class BootstrappedThemePlugin extends ThemePlugin {


	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'BootstrappedThemePlugin';
	}

	function getDisplayName() {
		return 'Bootstrapped Theme';
	}

	function getDescription() {
		return 'Extends "Bootstrappish" theme to further include Bootstrap elements';
	}

	function getStylesheetFilename() {
		return 'style.css'; //style.css until bootstrapification is complete. Then, main.css.
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}

	/**
	 * Activate the theme.
	 */
	function activate(&$templateMgr) {

		// Resets the template directory to the files in this directory -- Credit to https://github.com/cu-library/OJS-Modern-Theme for the fix/redirection

		$templateMgr->template_dir[0] = Core::getBaseDir() . DIRECTORY_SEPARATOR . 'plugins' . DIRECTORY_SEPARATOR . 'themes' . DIRECTORY_SEPARATOR . 'bootstrapped' . DIRECTORY_SEPARATOR . 'templates';
		$templateMgr->compile_id = 'bootstrapped';

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
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/modernizr.custom.64607.js');

		// Add in Bootstrap JS
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/bootstrap.min.js');
		// Add Notify JS
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/notify.min.js');
		// Add Custom JS
		$templateMgr->addJavaScript($this->getPluginPath() . '/js/custom.js');

		$templateMgr->assign('pluginPath', $this->getPluginPath());

		if (($stylesheetFilename = $this->getStylesheetFilename()) != null) {
			$path = Request::getBaseUrl() . '/' . $this->getPluginPath() . '/assets/stylesheets/' . $stylesheetFilename;
			$templateMgr->addStyleSheet($path);


		}

		$requestedPage = PKPRequest::getRequestedPage();
		if ($requestedPage == 'article') {
			$path = Request::getBaseUrl() . '/' . $this->getPluginPath() . '/assets/stylesheets/style_article.css';
			$templateMgr->addStyleSheet($path);
			$templateMgr->addJavaScript($this->getPluginPath() . '/js/article.js');
		}

	}

}

?>
