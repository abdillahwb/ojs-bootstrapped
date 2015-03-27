<div class="navbar-header">
	<a class="navbar-brand" href="{url page="index"}">{$siteTitle}</a>
</div>
<div class="navbar-default">
	<ul class="nav navbar-nav">
		<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
		{if $siteCategoriesEnabled}
			<li id="categories"><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>
		{/if}{* $categoriesEnabled *}

		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li id="current"><a href="{url page="issue" op="current"}">{translate key="navigation.current"}</a></li>
			<li id="archives">
				<a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a>
			</li>
		{/if}

		{if $enableAnnouncements}
			<li id="announcements"><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
		{/if}{* enableAnnouncements *}
		{if !empty($forReaders) || !empty($forAuthors) || !empty($forLibrarians)}
			<li id="info" class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a>
				<ul class="dropdown-menu" role="menu">
					{if !empty($forReaders)}<li><a href="{url page="information" op="readers"}">{translate key="navigation.infoForReaders"}</a></li><li class="nav-divider"></li>{/if}
					{if !empty($forAuthors)}<li><a href="{url page="information" op="authors"}">{translate key="navigation.infoForAuthors"}</a></li><li class="nav-divider"></li>{/if}
					{if !empty($forLibrarians)}<li><a href="{url page="information" op="librarians"}">{translate key="navigation.infoForLibrarians"}</a></li>{/if}
				</ul>
			</li>
			{/if}
		</ul>

		{call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

		{foreach from=$navMenuItems item=navItem key=navItemKey}
			{if $navItem.url != '' && $navItem.name != ''}
				<li class="nav-divider"></li>
				<li class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
	</ul>
</div>
<div class="navbar-right">
	<ul class="nav navbar-nav">
		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
		<li id="searchDrop" class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
          	<ul  class="dropdown-menu" role="menu">
          		<li id="searchTarget">
					<form class="form-inline" role="form" method="post" id="searchBar" action={url page="search"}>
						<div class="col-lg-6">
						    <div class="input-group">
						    	{capture assign="queryFilter"}{call_hook name="Templates::Search::SearchResults::FilterInput" filterName="query" filterValue=$query}{/capture}
								{if empty($queryFilter)}
									<input type="text" id="query" name="query" size="40" maxlength="255" value="{$query|escape}" class="form-control" placeholder="Search for..." />
								{else}
									{$queryFilter}
								{/if}
								<span class="input-group-btn">
									<button type="submit" class="btn btn-default">{translate key="common.search"}</button>
								</span>
							</div><!-- /input-group -->
						</div><!-- /.col-lg-6 -->
					</form>
				</li>
			</ul>
		</li>
		{/if}
		 <li id="user" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a>
          <ul class="dropdown-menu" role="menu">
			{if $isUserLoggedIn}
				<li id="userWelcome">
				<strong>Hello, {$loggedInUsername|escape}</strong></li>
				<li class="nav-divider"></li>
				<li id="userHome"><a href="{url journal="index" page="user"}">{translate key="navigation.userHome"}</a></li>
				<li class="nav-divider"></li>
				{if $hasOtherJournals}
				<li><a href="{url journal="index" page="user"}">{translate key="plugins.block.user.myJournals"}</a></li>
				<li class="nav-divider"></li>
				{/if}
				<li><a href="{url page="user" op="profile"}">{translate key="plugins.block.user.myProfile"}</a></li>
				<li class="nav-divider"></li>
				<li><a href="{url page="login" op="signOut"}">{translate key="plugins.block.user.logout"}</a></li>
				{if $userSession->getSessionVar('signedInAs')}
					<li><a href="{url page="login" op="signOutAsUser"}">{translate key="plugins.block.user.signOutAsUser"}</a></li>
				{/if}
			{else}
				<li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
				<li class="nav-divider"></li>
				{if !$hideRegisterLink}
					<li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
				{/if}
			{/if}{* $isUserLoggedIn *}
			</ul>
		</li>
		{if $isUserLoggedIn}
			 <li id="userNotify" class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span><div class="notify-badge"><span class="badge">{$unreadNotifications}</span></div></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="{url page="notification"}">{translate key="common.view"}</a>
						{if $unreadNotifications > 0}{translate key="notification.notificationsNew" numNew=$unreadNotifications}{/if}</li>
						<li class="nav-divider"></li>
					<li><a href="{url page="notification" op="settings"}">{translate key="common.manage"}</a></li>
				</ul>
			</li>
		{else}
			<li id="notifySub" class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="{url page="notification" op="subscribeMailList"}">{translate key="notification.subscribe"}</a></li>
				</ul>
			</li>
		{/if}
	</ul>
</div>	