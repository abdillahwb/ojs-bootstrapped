<?php

/**
 * @defgroup plugins_themes_bootstrapped
 */
 
/**
 * @file plugins/themes/bootstrapped/index.php
 *
 * Copyright (c) 2012 Christopher Anderton
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Wrapper for "bootstrappish" theme plugin.
 *
 * @ingroup plugins_themes_bootstrapped
 */

//$Id$

require_once('BootstrappedThemePlugin.inc.php');

return new BootstrappedThemePlugin();

?>
