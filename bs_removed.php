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
		function callbackDisplay($hookName, $args) {
			$smarty = $args[0]; /* @var $smarty Smarty */
			$additionalHeadData = $smarty->get_template_vars('additionalHeadData');
			$pluginScriptImportString = '<script language="javascript" type="text/javascript" src="' .
			Request::getBaseUrl() . DIRECTORY_SEPARATOR . $this->getPluginPath() . DIRECTORY_SEPARATOR . 'js/modernThemeSiteHandler.js"></script>';
			$googleFonts = "<link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz' rel='stylesheet' type='text/css' />" .
			"<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400' rel='stylesheet' type='text/css' />";
			$smarty->assign('additionalHeadData', $pluginScriptImportString . $googleFonts);
			$smarty->register_prefilter(array(&$this, 'addPluginSiteController'));
			return false;
	}