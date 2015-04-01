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
	<div class="visible-xs">
		<div class="navbar navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					{if $isUserLoggedIn}
						<button id="notifyBtn" type="button" class="navbar-toggle" data-toggle="dropdown" data-target="#mobileNotification" aria-expanded="false"  aria-haspopup="true">
							<span class="glyphicon glyphicon-bell" aria-hidden="true"></span><div class="notify-badge"><span class="badge">{$unreadNotifications}</span></div>
						</button>
					{else}
						<button id="subscribeBtn" type="button" class="navbar-toggle" data-toggle="dropdown" data-target="#mobileNotifySub" aria-expanded="false"  aria-haspopup="true">
							<span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span>
						</button>
					{/if}
					<button id="searchBtn" type="button" class="navbar-toggle" data-toggle="modal" data-target="#searchModal" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Search</span>
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				    <button id="navbarToggle" type="button" class="navbar-toggle pull-left" data-toggle="offcanvas" data-target=".navbar-collapse">
				    	<span class="sr-only">Toggle navigation</span>
		            	<span class="icon-bar"></span>
		            	<span class="icon-bar"></span>
		            	<span class="icon-bar"></span>
		          	</button>
		    		<a class="navbar-brand hidden-xs" href="{url page="index"}">{$siteTitle}</a> 
		   		</div>
			</div>
		</div>
<!-- Modal search build for mobile display -->
		<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">Search</h4>
		      </div>
		      <div class="modal-body">
		        <form class="form-inline" role="form" method="post" id="searchBar" action={url page="search"}>
					{capture assign="queryFilter"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="query" filterValue=$query}{/capture}
					{if empty($queryFilter)}
						<input type="text" id="query" name="query" size="40" maxlength="255" value="{$query|escape}" class="form-control" placeholder="Search for..." />
					{else}
						{$queryFilter}
					{/if}
					<br>
					<span class="input-group-btn">
						<button type="submit" class="btn btn-info">{translate key="common.search"}</button>
					</span>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
<!-- End Modal build -->
<!-- User and notification build for mobile display -->
		<div id="mobileUser" class="dropdown visible-xs">	
			<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="userBtn">
				{if $isUserLoggedIn}
					<li>
					<strong>&nbsp;{$loggedInUsername|escape}</strong></li>
					<li id="userHome"><a href="{url journal="index" page="user"}">{translate key="navigation.userHome"}</a></li>
					{if $hasOtherJournals}
					<li><a href="{url journal="index" page="user"}">{translate key="plugins.block.user.myJournals"}</a></li>
					{/if}
					<li><a href="{url page="user" op="profile"}">{translate key="plugins.block.user.myProfile"}</a></li>
					<li><a href="{url page="login" op="signOut"}">{translate key="plugins.block.user.logout"}</a></li>
					{if $userSession->getSessionVar('signedInAs')}
						<li><a href="{url page="login" op="signOutAsUser"}">{translate key="plugins.block.user.signOutAsUser"}</a></li>
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
	</div>
