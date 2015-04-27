{**
 * templates/manager/setup/step4.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 4 of journal setup.
 *
 *}
{assign var="pageTitle" value="manager.setup.managingTheJournal"}
{include file="manager/setup/setupHeader.tpl"}

<form id="setupForm" class="form-horizontal" method="post" action="{url op="saveSetup" path="4"}" enctype="multipart/form-data">
{include file="common/formErrors.tpl"}

{if count($formLocales) > 1}
<div id="locales">
	<div class="form-group">
		<label class="control-label col-sm-2">{fieldLabel name="formLocale" key="form.formLanguage"}</label>
		<div class="col-sm-10">
			{url|assign:"setupFormUrl" op="setup" path="4" escape=false}
			{form_language_chooser form="setupForm" url=$setupFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</div>
	</div>
</div><!-- locales -->
{/if}

<div id="securitySettings">
	<div class="form-group">
		<div class="col-sm-10">
			<h3>4.1 {translate key="manager.setup.securitySettings"}</h3>
		</div>
	</div>
	<div id="onlineAccessManagement">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.onlineAccessManagement"}</h4>
			</div>
		</div>
		<script type="text/javascript">
			{literal}
			<!--
				function togglePublishingMode(form) {
					if (form.publishingMode[0].checked) {
						// PUBLISHING_MODE_OPEN
						form.openAccessPolicy.disabled = false;
						form.showGalleyLinks.disabled = true;
					} else if (form.publishingMode[1].checked) {
						// PUBLISHING_MODE_SUBSCRIPTION
						form.openAccessPolicy.disabled = true;
						form.showGalleyLinks.disabled = false;
					} else {
						// PUBLISHING_MODE_NONE
						form.openAccessPolicy.disabled = true;
						form.showGalleyLinks.disabled = true;
					}
				}
			// -->
			{/literal}
		</script>

		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="radio" name="publishingMode" id="publishingMode-0" value="{$smarty.const.PUBLISHING_MODE_OPEN}" onclick="togglePublishingMode(this.form)"{if $publishingMode == $smarty.const.PUBLISHING_MODE_OPEN} checked="checked"{/if} />&nbsp;{translate key="manager.setup.openAccess"}
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.openAccessPolicy"}</h4>
				<p><span class="instruct">{translate key="manager.setup.openAccessPolicyDescription"}</span></p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="openAccessPolicy[{$formLocale|escape}]" id="openAccessPolicy" rows="12" cols="60" class="textArea"{if $publishingMode != $smarty.const.PUBLISHING_MODE_OPEN} disabled="disabled"{/if}>{$openAccessPolicy[$formLocale]|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
		</div>

		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="radio" name="publishingMode" id="publishingMode-1" value="{$smarty.const.PUBLISHING_MODE_SUBSCRIPTION}" onclick="togglePublishingMode(this.form)"{if $publishingMode == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION} checked="checked"{/if} />
					{translate key="manager.setup.subscription"}
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<p><span class="instruct">{translate key="manager.setup.subscriptionDescription"}</span></p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="showGalleyLinks" id="showGalleyLinks" {if $showGalleyLinks} checked="checked"{/if} />&nbsp;{translate key="manager.setup.showGalleyLinksDescription"}
				</label>
			</div>
		</div>

		<div class="form-group">
		</div>

		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="radio" name="publishingMode" id="publishingMode-2" value="{$smarty.const.PUBLISHING_MODE_NONE}" onclick="togglePublishingMode(this.form)"{if $publishingMode == $smarty.const.PUBLISHING_MODE_NONE} checked="checked"{/if} />&nbsp;{translate key="manager.setup.noPublishing"}
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<p>{translate key="manager.setup.securitySettingsDescription"}</p>
			</div>
		</div>
	</div><!-- onlineAccessManagement -->

	<script type="text/javascript">
	{literal}
	<!--
	function setRegAllowOpts(form) {
		if(form.disableUserReg[0].checked) {
			form.allowRegReader.disabled=false;
			form.allowRegAuthor.disabled=false;
			form.allowRegReviewer.disabled=false;
		} else {
			form.allowRegReader.disabled=true;
			form.allowRegAuthor.disabled=true;
			form.allowRegReviewer.disabled=true;
		}
	}
	// -->
	{/literal}
	</script>

	<div id="siteAccess">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.siteAccess"}</h4>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">	
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="restrictSiteAccess" id="restrictSiteAccess" value="1"{if $restrictSiteAccess} checked="checked"{/if} />&nbsp;{translate key="manager.setup.restrictSiteAccess"}
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="restrictArticleAccess" id="restrictArticleAccess" value="1"{if $restrictArticleAccess} checked="checked"{/if} />&nbsp;{translate key="manager.setup.restrictArticleAccess"}
				</label>
			</div>
		</div>
	</div><!-- siteAccess -->

	<div id="userRegistration">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.userRegistration"}</h4>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="radio" name="disableUserReg" id="disableUserReg-0" value="0" onclick="setRegAllowOpts(this.form)"{if !$disableUserReg} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enableUserRegistration"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="allowRegReader" id="allowRegReader" value="1"{if $allowRegReader} checked="checked"{/if}{if $disableUserReg} disabled="disabled"{/if} />&nbsp;{translate key="manager.setup.enableUserRegistration.reader"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="allowRegAuthor" id="allowRegAuthor" value="1"{if $allowRegAuthor} checked="checked"{/if}{if $disableUserReg} disabled="disabled"{/if} />&nbsp;{translate key="manager.setup.enableUserRegistration.author"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="allowRegReviewer" id="allowRegReviewer" value="1"{if $allowRegReviewer} checked="checked"{/if}{if $disableUserReg} disabled="disabled"{/if} />&nbsp;{translate key="manager.setup.enableUserRegistration.reviewer"}
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="radio" name="disableUserReg" id="disableUserReg-1" value="1" onclick="setRegAllowOpts(this.form)"{if $disableUserReg} checked="checked"{/if} />&nbsp;{translate key="manager.setup.disableUserRegistration"}
				</label>
			</div>
		</div>
	</div><!-- userRegistration -->
</div><!-- securitySettings -->

<div class="form-group">
	<div class="separator"></div>
</div>

<div id="publicationScheduling">
	<div class="form-group">
		<div class="col-sm-10">
			<h3>4.2 {translate key="manager.setup.publicationScheduling"}</h3>
		</div>
	</div>

	<div id="publicationSchedule">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.publicationSchedule"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.publicationScheduleDescription"}</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="pubFreqPolicy[{$formLocale|escape}]" id="pubFreqPolicy" rows="12" cols="60" class="textArea">{$pubFreqPolicy[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div>
	<div id="publicationFormat">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.publicationFormat"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.publicationFormatDescription"}</p>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="publicationFormatVolume" id="publicationFormatVolume" value="1"{if ($publicationFormatVolume)} checked="checked"{/if} />&nbsp;{translate key="manager.setup.publicationFormatVolume"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="publicationFormatNumber" id="publicationFormatNumber" value="1"{if ($publicationFormatNumber)} checked="checked"{/if} />&nbsp;{translate key="manager.setup.publicationFormatNumber"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="publicationFormatYear" id="publicationFormatYear" value="1"{if ($publicationFormatYear)} checked="checked"{/if} />&nbsp;{translate key="manager.setup.publicationFormatYear"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="publicationFormatTitle" id="publicationFormatTitle" value="1"{if ($publicationFormatTitle)} checked="checked"{/if} />&nbsp;{translate key="manager.setup.publicationFormatTitle"}
				</label>
			</div>
		</div>
	</div>
	<div id="frequencyOfPublication">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.frequencyOfPublication"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.frequencyOfPublicationDescription"}</p>
			</div>
		</div>
		<div class="input-group col-sm-10">
			<div class="input-group-addon">
				<label class="control-label">{fieldLabel name="initialNumber" key="issue.number"}</label>
			</div>
			<input type="text" name="initialNumber" id="initialNumber" value="{$initialNumber|escape}" size="5" maxlength="8" class="form-control" />
		</div>
		<div class="form-group"></div>
		<div class="input-group col-sm-10">
			<div class="input-group-addon">
				<label class="control-label">{fieldLabel name="initialVolume" key="issue.volume"}</label>
			</div>
			<input type="text" name="initialYear" id="initialYear" value="{$initialYear|escape}" size="5" maxlength="8" class="form-control" />
		</div>
		<div class="form-group"></div>
		<div class="input-group col-sm-10">
			<div class="input-group-addon">
				<label class="control-label">{fieldLabel name="initialYear" key="issue.year"}</label>
			</div>
			<input type="text" name="initialVolume" id="initialVolume" value="{$initialVolume|escape}" size="5" maxlength="8" class="form-control" />
		</div>
		<div class="form-group"></div>
		<div class="input-group col-sm-10">
			<div class="input-group-addon">
				<label class="control-label">{fieldLabel name="issuePerVolume" key="manager.setup.issuePerVolume"}</label>
			</div>
			<input type="text" name="issuePerVolume" id="issuePerVolume" value="{if $issuePerVolume}{$issuePerVolume|escape}{/if}" size="5" maxlength="8" class="form-control" />
		</div>
		<div class="form-group"></div>
		<div class="input-group col-sm-10">
			<div class="input-group-addon">
				<label class="control-label">{fieldLabel name="volumePerYear" key="manager.setup.volumePerYear"}</label>
			</div>
			<input type="text" name="volumePerYear" id="volumePerYear" value="{if $volumePerYear}{$volumePerYear|escape}{/if}" size="5" maxlength="8" class="form-control" />
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<p>{translate key="manager.setup.frequencyOfPublicationNote"}</p>
			</div>
		</div>
	</div>
</div>


<div class="form-group">
	<div class="separator"></div>
</div>

<div id="publicIdentifier">
	<div class="form-group">
		<div class="col-sm-10">
			<h3>4.3 {translate key="manager.setup.publicIdentifier"}</h3>
		</div>
	</div>

	<div id="uniqueIdentifier">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.uniqueIdentifier"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.uniqueIdentifierDescription"}</p>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="enablePublicIssueId" id="enablePublicIssueId" value="1"{if $enablePublicIssueId} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enablePublicIssueId"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="enablePublicArticleId" id="enablePublicArticleId" value="1"{if $enablePublicArticleId} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enablePublicArticleId"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="enablePublicGalleyId" id="enablePublicGalleyId" value="1"{if $enablePublicGalleyId} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enablePublicGalleyId"}
				</label>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="enablePublicSuppFileId" id="enablePublicSuppFileId" value="1"{if $enablePublicSuppFileId} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enablePublicSuppFileId"}
				</label>
			</div>
		</div>
	</div><!-- uniqueIdentifier -->
	<br />
	<div id="pageNumberIdentifier">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.pageNumberIdentifier"}</h4>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="enablePageNumber" id="enablePageNumber" value="1"{if $enablePageNumber} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enablePageNumber"}
				</label>
			</div>
		</div>
	</div><!-- pageNumberIdentifier -->
</div><!-- publicIdentifier -->

<div class="form-group">
	<div class="separator"></div>
</div>

<div id="announcementsSection">
	<div class="form-group">
		<div class="col-sm-10">
			<h3>4.4 {translate key="manager.setup.announcements"}</h3>
		</div>
		<div class="col-sm-10">
			<p>{translate key="manager.setup.announcementsDescription"}</p>
		</div>
	</div>
	<script type="text/javascript">
		{literal}
		<!--
			function toggleEnableAnnouncementsHomepage(form) {
				form.numAnnouncementsHomepage.disabled = !form.numAnnouncementsHomepage.disabled;
			}
		// -->
		{/literal}
	</script>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="checkbox" name="enableAnnouncements" id="enableAnnouncements" value="1" {if $enableAnnouncements} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enableAnnouncements"}
			</label>
		</div>
	</div>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="checkbox" name="enableAnnouncementsHomepage" id="enableAnnouncementsHomepage" value="1" onclick="toggleEnableAnnouncementsHomepage(this.form)"{if $enableAnnouncementsHomepage} checked="checked"{/if} />&nbsp;{translate key="manager.setup.enableAnnouncementsHomepage1"}
			</label>
		</div>
		<div id="displayNumAnnouncements" class="col-sm-10">
			<label class="emptyInputGroup btn-default">
			<select name="numAnnouncementsHomepage" size="1" class="form-control" {if not $enableAnnouncementsHomepage}disabled="disabled"{/if}>
				{section name="numAnnouncementsHomepageOptions" start=1 loop=11}
				<option value="{$smarty.section.numAnnouncementsHomepageOptions.index}"{if $numAnnouncementsHomepage eq $smarty.section.numAnnouncementsHomepageOptions.index or ($smarty.section.numAnnouncementsHomepageOptions.index eq 1 and not $numAnnouncementsHomepage)} selected="selected"{/if}>{$smarty.section.numAnnouncementsHomepageOptions.index}</option>
				{/section}
			</select>
			{translate key="manager.setup.enableAnnouncementsHomepage2"}
			</label>
		</div>
	</div>
	<div id="announcementsIntroductionSection">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.announcementsIntroduction"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.announcementsIntroductionDescription"}</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="announcementsIntroduction[{$formLocale|escape}]" id="announcementsIntroduction" rows="12" cols="60" class="textArea">{$announcementsIntroduction[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div><!-- announcementsIntroductionSection -->
</div><!-- announcementsSection -->

<div class="form-group">
	<div class="separator"></div>
</div>

<div id="copyediting">
	<div class="form-group">
		<div class="col-sm-10">
			<h3>4.5 {translate key="manager.setup.copyediting"}</h3>
		</div>
		<div class="col-sm-10">
			<p>{translate key="manager.setup.selectOne"}:</p>
		</div>
	</div>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="radio" name="useCopyeditors" id="useCopyeditors-1" value="1"{if $useCopyeditors} checked="checked"{/if} />&nbsp;{translate key="manager.setup.useCopyeditors"}
			</label>
		</div>
	</div>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="radio" name="useCopyeditors" id="useCopyeditors-0" value="0"{if !$useCopyeditors} checked="checked"{/if} />&nbsp;{translate key="manager.setup.noUseCopyeditors"}
			</label>
		</div>
	</div>
</div><!-- copyediting -->

<div id="copyeditInstructionsSection">
	<div class="form-group">
		<div class="col-sm-10">
			<h4>{translate key="manager.setup.copyeditInstructions"}</h4>
		</div>
		<div class="col-sm-10">
			<p>{translate key="manager.setup.copyeditInstructionsDescription"}</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10">
			<textarea name="copyeditInstructions[{$formLocale|escape}]" id="copyeditInstructions" rows="12" cols="60" class="textArea">{$copyeditInstructions[$formLocale]|escape}</textarea>
		</div>
	</div>
</div><!-- copyeditInstructionsSection -->

<div class="form-group">
	<div class="separator"></div>
</div>

<div id="layoutAndGalleys">
	<div class="form-group">
		<div class="col-sm-10">
			<h3>4.6 {translate key="manager.setup.layoutAndGalleys"}</h3>
		</div>
		<div class="col-sm-10">
			<p>{translate key="manager.setup.selectOne"}:</p>
		</div>
	</div>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="radio" name="useLayoutEditors" id="useLayoutEditors-1" value="1"{if $useLayoutEditors} checked="checked"{/if} />&nbsp;{translate key="manager.setup.useLayoutEditors"}
			</label>
		</div>
	</div>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="radio" name="useLayoutEditors" id="useLayoutEditors-0" value="0"{if !$useLayoutEditors} checked="checked"{/if} />&nbsp;{translate key="manager.setup.noUseLayoutEditors"}
			</label>
		</div>
	</div>
	<div id="layoutInstructionsSection">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.layoutInstructions"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.layoutInstructionsDescription"}</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="layoutInstructions[{$formLocale|escape}]" id="layoutInstructions" rows="12" cols="60" class="textArea">{$layoutInstructions[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div><!-- layoutInstructionsSection -->

	<div id="layoutTemplates">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.layoutTemplates"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.layoutTemplatesDescription"}</p>
			</div>
		</div>
		<div class="input-group col-sm-10">
			<div class="input-group-addon">
				<label class="control-label">{fieldLabel name="template-title" key="manager.setup.layoutTemplates.title"}</label>
			</div>
			<input type="text" name="template-title" id="template-title" size="40" maxlength="90" class="form-control" />
		</div>
		<div class="input-group col-sm-10">
			<div class="input-group-addon">
				<label class="control-label">{fieldLabel name="template-file" key="manager.setup.layoutTemplates.file"}</label>
			</div>
			<input type="file" name="template-file" id="template-file" class="form-control" />
			<div class="input-group-addon">
				<input type="submit" name="addTemplate" value="{translate key="common.upload"}" class="btn btn-info" />
			</div>
		</div>
		{foreach name=templates from=$templates key=templateId item=template}
			<div class="form-group">
				<div class="col-sm-10">
					<label class="control-label"><a href="{url op="downloadLayoutTemplate" path=$templateId}" class="action" value="{$template.title|escape}">{$template.filename|escape}</a></label>
				</div>
				<div class="col-sm-10">
					<input type="submit" name="delTemplate[{$templateId|escape}]" value="{translate key="common.delete"}" class="btn btn-danger" />
				</div>
			</div>
		{/foreach}
	</div><!-- layoutTemplates -->

	<div id="referenceLinking">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.referenceLinking"}</h4>
			</div>
			<div class="col-sm-10 formOptions">
				<p>{translate key="manager.setup.referenceLinkingDescription"}</p>
			</div>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="provideRefLinkInstructions" id="provideRefLinkInstructions" value="1"{if $provideRefLinkInstructions} checked="checked"{/if} />&nbsp;{translate key="manager.setup.provideRefLinkInstructions"}
				</label>
			</div>
		</div>
	</div><!-- referenceLinking -->

	<div id="refLinkInstructionsSection">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.refLinkInstructions.description"}</h4>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="refLinkInstructions[{$formLocale|escape}]" id="refLinkInstructions" rows="12" cols="60" class="form-control">{$refLinkInstructions[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div><!-- refLinkInstructionsSection -->
</div>

<div class="form-group">
	<div class="separator"></div>
</div>

<div id="proofreading">
	<div class="form-group">
		<div class="col-sm-10">
			<h3>4.7 {translate key="manager.setup.proofreading"}</h3>
		</div>
		<div class="col-sm-10">
			<p>{translate key="manager.setup.selectOne"}:</p>
		</div>
	</div>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="radio" name="useProofreaders" id="useProofreaders-1" value="1"{if $useProofreaders} checked="checked"{/if} />&nbsp;{translate key="manager.setup.useProofreaders"}
			</label>
		</div>
	</div>
	<div class="form-group formOptions">
		<div class="col-sm-10">
			<label class="emptyInputGroup btn-default">
				<input type="radio" name="useProofreaders" id="useProofreaders-0" value="0"{if !$useProofreaders} checked="checked"{/if} />&nbsp;{translate key="manager.setup.noUseProofreaders"}
			</label>
		</div>
	</div>
	<div id="proofingInstructions">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.proofingInstructions"}</h4>
			</div>
			<div class="col-sm-10">
				<p>{translate key="manager.setup.proofingInstructionsDescription"}</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="proofInstructions[{$formLocale|escape}]" id="proofInstructions" rows="12" cols="60" class="form-control">{$proofInstructions[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="separator"></div>
</div>

<div class="form-group">
	<div class="col-sm-10">
		<input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-success" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger" onclick="document.location.href='{url op="setup" escape=false}'" />
	</div>
	<div class="col-sm-10">
		<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
	</div>
</div>
</form>

{include file="common/footer.tpl"}

