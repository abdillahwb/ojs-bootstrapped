<ul class="nav navbar-nav">
	<li class="dropdown">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account</a>
		<ul class="dropdown-menu" role="menu">
			{if $isUserLoggedIn}
				<li id="userWelcome">
				<strong>Hello, {$loggedInUsername|escape}</strong></li>
				<li class="nav-divider"></li>
				<li id="userHome"><a href="{url journal="index" page="user"}">{translate key="navigation.userHome"}</a></li>
				<li class="nav-divider"></li>
				{if $hasOtherJournals}
				<li><a href="{url journal="index" page="user"}">{translate key="plugins.themes.bootstrapped.myJournals"}</a></li>
				<li class="nav-divider"></li>
				{/if}
				<li><a href="{url page="user" op="profile"}">{translate key="plugins.themes.bootstrapped.myProfile"}</a></li>
				<li class="nav-divider"></li>
				<li><a href="{url page="login" op="signOut"}">{translate key="plugins.themes.bootstrapped.logout"}</a></li>
				{if $userSession->getSessionVar('signedInAs')}
					<li><a href="{url page="login" op="signOutAsUser"}">{translate key="plugins.themes.bootstrapped.signOutAsUser"}</a></li>
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
	<li class="nav-divider"></li>
	<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
	<li class="nav-divider"></li>
	{if $siteCategoriesEnabled}
		<li id="categories"><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>
		<li class="nav-divider"></li>
	{/if}{* $categoriesEnabled *}

	{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
		<li id="current"><a href="{url page="issue" op="current"}">{translate key="navigation.current"}</a></li>
		<li class="nav-divider"></li>
		<li id="archives">
			<a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a>
		</li>
		<li class="nav-divider"></li>
	{/if}

	{if $enableAnnouncements}
		<li id="announcements"><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
		<li class="nav-divider"></li>
	{/if}{* enableAnnouncements *}
	{if !empty($forReaders) || !empty($forAuthors) || !empty($forLibrarians)}
		<li class="dropdown">
			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Information</a>
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
