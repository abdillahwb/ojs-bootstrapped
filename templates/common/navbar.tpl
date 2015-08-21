{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * This stands as a complete rework of the original PKP OJS navbar.
 * It fully incorporates and embraces Bootstrap.
 *
 * Navigation Bar
 *
 *}
	<div class="hidden-xs">
 		<nav class="navbar navbar-default navbar-static-top">
			{include file="common/mainNavSection.tpl"}
		</nav>
	</div>
	<nav class="navbar navbar-default navbar-static-top visible-xs">
	   <div class="container-fluid">
		   <div class="navbar-header">
			   <a id="no-js-home" href="{url context=$homeContext page="index"}"><button id="navbarToggle" type="button" class="navbar-toggle pull-left" data-toggle="collapse" data-target=".navbar-collapse">
				   <span class="sr-only">Toggle navigation</span>
				   <span class="icon-bar"></span>
				   <span class="icon-bar"></span>
				   <span class="icon-bar"></span>
			   </button></a>
			   <a id="no-js-search" href="{url page="search"}"><button id="searchBtn" type="button" class="navbar-toggle navbar--mobile--search" data-toggle="modal" data-target="#searchModal" aria-expanded="false" aria-controls="navbar">
				   <span class="sr-only">Search</span>
				   <span class="glyphicon glyphicon-search navbar__glyph--mobile" aria-hidden="true"></span>
			   </button></a>
			   {if $isUserLoggedIn}
				   <a href="{url page="notification"}"><button id="notifyBtn" type="button" class="navbar-toggle navbar--mobile--notify">
					   <span class="glyphicon glyphicon-bell navbar__glyph--mobile" aria-hidden="true"></span><div class="navbar__notify-badge" {if $unread == 0} style="margin-left: -.8em;"{/if}><span class="badge" {if $unread == 0} style="visibility: hidden;"{/if}>{if $unread > 0} {$unread}{else}0{/if}</span></div>
				   </button></a>
			   {else}
				   <a href="{url page="notification" op="subscribeMailList"}"><button id="subscribeBtn" type="button" class="navbar-toggle">
					   <span class="glyphicon glyphicon-bullhorn navbar__glyph--mobile" aria-hidden="true"></span>
				   </button></a>
			   {/if}
			   </div>
		   <div class="navbar-collapse collapse">
			   {include file="common/mobileMainNavSection.tpl"}
		   </div>

	   </div>
	</nav>
<!-- User and notification build for mobile display -->
		<div id="mobileUser" class="dropdown visible-xs">
			<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="userBtn">
				{if $isUserLoggedIn}
					<li>
					<strong>&nbsp;{$loggedInUsername|escape}</strong></li>
					<li id="userHome"><a href="{url journal="index" page="user"}">{translate key="navigation.userHome"}</a></li>
					{if $hasOtherJournals}
					<li><a href="{url journal="index" page="user"}">{translate key="plugins.themes.bootstrapped.myJournals"}</a></li>
					{/if}
					<li><a href="{url page="user" op="profile"}">{translate key="plugins.themes.bootstrapped.myProfile"}</a></li>
					<li><a href="{url page="login" op="signOut"}">{translate key="plugins.themes.bootstrapped.logout"}</a></li>
					{if $userSession->getSessionVar('signedInAs')}
						<li><a href="{url page="login" op="signOutAsUser"}">{translate key="plugins.themes.bootstrapped.signOutAsUser"}</a></li>
					{/if}
				{else}
					<li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
					{if !$hideRegisterLink}
						<li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
					{/if}
				{/if}{* $isUserLoggedIn *}
			</ul>
		</div>
		<div id="mobileNotification" class="dropdown visible-xs" aria-labelledby="notifyBtn">
			<ul class="dropdown-menu pull-right" role="menu">
				<li><a href="{url page="notification"}">{translate key="common.view"}</a>
					{if $unreadNotifications > 0}{translate key="notification.notificationsNew" numNew=$unreadNotifications}{/if}</li>
				<li><a href="{url page="notification" op="settings"}">{translate key="common.manage"}</a></li>
			</ul>
		</div>
		<div id="mobileNotifySub" class="dropdown visible-xs" aria-labelledby="notifyBtn">
			<ul class="dropdown-menu pull-right" role="menu">
				<li><a href="{url page="notification" op="subscribeMailList"}">{translate key="notification.subscribe"}</a></li>
			</ul>
		</div>
<!-- End build -->
