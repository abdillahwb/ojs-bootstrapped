{**
 * templates/article/dublincore.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Dublin Core metadata elements for articles.
 *
 *}
<link rel="schema.DC" href="http://purl.org/dc/elements/1.1/" />

{* DC.Contributor.PersonalName (reviewer) *}

<!-- Editted to reflect VT specific edits -->

{if !is_null($journal->getSetting('sponsors'))}{assign var="sponsors" value=$journal->getSetting('sponsors')}{foreach name=sponsors from=$sponsors key=sponsorId item=sponsor}
	<meta name="DC.Contributor.Sponsor" xml:lang="{$article->getLocale()|String_substr:0:2|escape}" content="{$sponsor.institution|escape}"/>
{/foreach}{/if}

{if !is_null($journal->getSetting('publisherInstitution'))}
	<meta name="DC.publisher" xml:lang="{$article->getLocale()|String_substr:0:2|escape}" content="{$journal->getSetting('publisherInstitution')|escape}"/>
{/if}

{assign var="titles" value=$journal->getSetting('title')}{foreach name=titles from=$titles key=titleId item=title}
	{assign var="journalTitle" value=$title}
{/foreach}

<meta name="DCTERMS.bibliographicCitation" content="{$journalTitle|escape} {$issue->getVolume()|strip_tags|escape}({$issue->getNumber()|strip_tags|escape}): ({$article->getDatePublished()|date_format:"%Y"})" />
<!-- End VT specific edits -->
{if $article->getCoverageSample(null)}{foreach from=$article->getCoverageSample(null) key=metaLocale item=metaValue}
	<meta name="DC.Coverage" xml:lang="{$metaLocale|String_substr:0:2|escape}" content="{$metaValue|strip_tags|escape}"/>
{/foreach}{/if}
{if $article->getCoverageGeo(null)}{foreach from=$article->getCoverageGeo(null) key=metaLocale item=metaValue}
	<meta name="DC.Coverage.spatial" xml:lang="{$metaLocale|String_substr:0:2|escape}" content="{$metaValue|strip_tags|escape}"/>
{/foreach}{/if}
{if $article->getCoverageChron(null)}{foreach from=$article->getCoverageChron(null) key=metaLocale item=metaValue}
	<meta name="DC.Coverage.temporal" xml:lang="{$metaLocale|String_substr:0:2|escape}" content="{$metaValue|strip_tags|escape}"/>
{/foreach}{/if}
{foreach from=$article->getAuthorString()|explode:", " item=dc_author}
	<meta name="DC.Creator.PersonalName" content="{$dc_author|escape}"/>
{/foreach}
{if $issue && $issue->getOpenAccessDate()}
	<meta name="DC.Date.available" scheme="ISO8601" content="{$issue->getOpenAccessDate()|date_format:"%Y-%m-%d"}"/>
{/if}
{if is_a($article, 'PublishedArticle') && $article->getDatePublished()}
	<meta name="DC.Date.created" scheme="ISO8601" content="{$article->getDatePublished()|date_format:"%Y"}"/>
{/if}
{* DC.Date.dateAccepted (editor submission DAO) *}
{* DC.Date.dateCopyrighted *}
{* DC.Date.dateReveiwed (revised file DAO) *}
	<meta name="DC.Date.dateSubmitted" scheme="ISO8601" content="{$article->getDateSubmitted()|date_format:"%Y-%m-%d"}"/>
{if $issue && $issue->getDatePublished()}
	<meta name="DC.Date.issued" scheme="ISO8601" content="{$issue->getDatePublished()|date_format:"%Y"}"/>
{/if}
	<meta name="DC.Date.modified" scheme="ISO8601" content="{$article->getDateStatusModified()|date_format:"%Y-%m-%d"}"/>
{if $article->getAbstract(null)}{foreach from=$article->getAbstract(null) key=metaLocale item=metaValue}
	<meta name="DC.Description" xml:lang="{$metaLocale|String_substr:0:2|escape}" content="{$metaValue|strip_tags|escape}"/>
{/foreach}{/if}
{if is_a($article, 'PublishedArticle')}{foreach from=$article->getGalleys() item=dcGalley}
	<meta name="DC.Format" scheme="IMT" content="{$dcGalley->getFileType()|escape}"/>
{/foreach}{/if}
	<meta name="DC.Identifier" content="{$article->getBestArticleId($currentJournal)|escape}"/>
{if $article->getPages()}
	<meta name="DC.Identifier.pageNumber" content="{$article->getPages()|escape}"/>
{/if}
{foreach from=$pubIdPlugins item=pubIdPlugin}
	{if $issue->getPublished()}
		{assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
	{else}
		{assign var=pubId value=$pubIdPlugin->getPubId($pubObject, true)}{* Preview rather than assign a pubId *}
	{/if}
	{if $pubId}
		<meta name="DC.Identifier.{$pubIdPlugin->getPubIdDisplayType()|escape}" content="{$pubId|escape}"/>
	{/if}
{/foreach}
	<meta name="DC.Identifier.URI" content="{url page="article" op="view" path=$article->getBestArticleId($currentJournal)}"/>
	<meta name="DC.Language" scheme="ISO639-1" content="{$article->getLanguage()|strip_tags|escape}"/>
{* DC.Publisher (publishing institution) *}
{* DC.Publisher.Address (email addr) *}
	<meta name="DC.Rights" content="{translate key="submission.copyrightStatement" copyrightHolder=$article->getLocalizedCopyrightHolder()|escape copyrightYear=$article->getCopyrightYear()|escape}" />
	<meta name="DC.Rights" content="{$article->getLicenseURL()|escape}"/>
{* DC.Rights.accessRights *}
	<meta name="DC.Source" content="{$currentJournal->getLocalizedTitle()|strip_tags|escape}"/>
{if $currentJournal->getSetting('onlineIssn')}{assign var="issn" value=$currentJournal->getSetting('onlineIssn')}
{elseif $currentJournal->getSetting('printIssn')}{assign var="issn" value=$currentJournal->getSetting('printIssn')}
{elseif $currentJournal->getSetting('issn')}{assign var="issn" value=$currentJournal->getSetting('issn')}
{/if}
{if $issn}
	<meta name="DC.Source.ISSN" content="{$issn|strip_tags|escape}"/>
{/if}
	{if $issue}<meta name="DC.Source.Issue" content="{$issue->getNumber()|strip_tags|escape}"/>{/if}
	<meta name="DC.Source.URI" content="{$currentJournal->getUrl()|strip_tags|escape}"/>
	{if $issue}<meta name="DC.Source.Volume" content="{$issue->getVolume()|strip_tags|escape}"/>{/if}
{if $article->getSubject(null)}{foreach from=$article->getSubject(null) key=metaLocale item=metaValue}
	{foreach from=$metaValue|explode:"; " item=dcSubject}
		{if $dcSubject}
			<meta name="DC.Subject" xml:lang="{$metaLocale|String_substr:0:2|escape}" content="{$dcSubject|escape}"/>
		{/if}
	{/foreach}
{/foreach}{/if}
	<meta name="DC.Title" content="{$article->getLocalizedTitle()|strip_tags|escape}"/>
{foreach from=$article->getTitle(null) item=alternate key=metaLocale}
	{if $alternate != $article->getLocalizedTitle()}
		<meta name="DC.Title.Alternative" xml:lang="{$metaLocale|String_substr:0:2|escape}" content="{$alternate|strip_tags|escape}"/>
	{/if}
{/foreach}
	<meta name="DC.Type" content="Text.Serial.Journal"/>
	<meta name="DC.Type.articleType" content="{$article->getSectionTitle()|strip_tags|escape}"/>

