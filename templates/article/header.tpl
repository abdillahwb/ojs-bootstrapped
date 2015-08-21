{**
 * templates/article/header.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Header component.
 *}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" xmlns="http://www.w3.org/1999/xhtml" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="description" content="{$article->getLocalizedTitle()|strip_tags|escape}" />
	{if $article->getLocalizedSubject()}
		<meta name="keywords" content="{$article->getLocalizedSubject()|escape}" />
	{/if}

	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}

	{include file="article/dublincore.tpl"}
	{include file="article/googlescholar.tpl"}
	{call_hook name="Templates::Article::Header::Metadata"}

	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}

	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">{literal}
		// Provide a local fallback if the CDN cannot be reached
		if (typeof google == 'undefined') {
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
		} else {
			google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
			google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
		}
	{/literal}</script>
	{else}
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}

	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	{$additionalHeadData}
</head>
<body>

<div id="container">

<div id="header">
<div id="headerTitle">
<<<<<<< HEAD
=======
<h1><img id="vt-logo" src="{$baseUrl}/{$pluginPath}/assets/img/vt_logo_tm_320px.png" alt="Virginia Tech Logo" /></h1>
<!-- <h1>
>>>>>>> master
{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
	<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
{/if}
{if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
	<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
{elseif $displayPageHeaderTitle}
<h1>
	{$displayPageHeaderTitle}
{elseif $alternatePageHeader}
<h1>
	{$alternatePageHeader}
{elseif $siteTitle}
<h1>
	{$siteTitle}
{else}
<h1>
	{$applicationName}
{/if}
</h1>
</div>
</div>

{include file="common/navbar.tpl"}
<div id="breadcrumb">
	<ol class="breadcrumb">
		<li>
			<a href="{url page="index"}" target="_parent">{translate key="navigation.home"}</a>
		</li>
		{if $issue}<li><a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a></li>{/if}
		<li>
			<a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a>
		</li>
	</ol>
</div>
<div class="container" id="body">

<div class="row row-offcanvas row-offcanvas-left">
<<<<<<< HEAD
	<div class="row-offcanvas row-offcanvas-right">
=======
<div class="visible-xs col-md-12" id="canvas-sidebar" role="navigation" style="">
			<div class="sidebar-nav">
  				{include file="common/mobileMainNavSection.tpl"}
			</div>
		</div>

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar-tab">
	<a href="#" role="button" aria-expanded="false"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span></a>
	</div>
		<div id="sidebar" class="hide">
>>>>>>> master
		{if $leftSidebarCode}
			<div id="sidebarLeft"
			{if $rightSidebarCode}
				class="col-xs-6 col-sm-3 col-md-2 sidebar-offcanvas"
			{else}
				class="col-xs-6 col-sm-3 col-md-3 col-lg-2 sidebar-offcanvas"
			{/if}
				role="navigation">
				<div id="leftSidebar" class="sidebar-nav">
					<ul class="nav">
						{$leftSidebarCode}
					</ul>
				</div>
			</div>
		{/if}
	<div id="main"
		{if $leftSidebarCode && $rightSidebarCode}
			class="col-xs-12 col-sm-6 col-md-8"
		{elseif $leftSidebarCode || $rightSidebarCode}
			class="col-xs-12 col-sm-9 col-md-9 col-lg-10"
		{else}
			class="col-lg-12"
		{/if}
			>
		{if $leftSidebarCode}
		<p class="pull-left visible-xs" style="margin-right: 1em;">
            <button class="btn btn-info btn-lg" type="button" data-toggle="offcanvas"><span class="glyphicon glyphicon-chevron-left"></span></button>
        </p>
		{/if}
		{if $rightSidebarCode}
        <p class="pull-right visible-xs">
            <button class="btn btn-info btn-lg" type="button" data-toggle="offcanvasright"><span class="glyphicon glyphicon-chevron-right"></span></button>
        </p>
		{/if}
	{include file="common/scroll2top.tpl"}
		<div id="content">
