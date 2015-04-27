{**
 * templates/author/submit/step1.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 1 of author article submission.
 *
 *}
{assign var="pageTitle" value="author.submit.step1"}
{include file="author/submit/submitHeader.tpl"}

{if $journalSettings.supportPhone}
	{assign var="howToKeyName" value="author.submit.howToSubmit"}
{else}
	{assign var="howToKeyName" value="author.submit.howToSubmitNoPhone"}
{/if}

<p>{translate key=$howToKeyName supportName=$journalSettings.supportName supportEmail=$journalSettings.supportEmail supportPhone=$journalSettings.supportPhone}</p>

<div class="separator"></div>

<form id="submit" class="form-horizontal" method="post" action="{url op="saveSubmit" path=$submitStep}" onsubmit="return checkSubmissionChecklist()">
{include file="common/formErrors.tpl"}
	{if $articleId}
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="articleId" value="{$articleId|escape}" />
			</div>
		</div>
	{/if}

	{if count($sectionOptions) <= 1}
		<p>{translate key="author.submit.notAccepting"}</p>
	{else}
		{if count($sectionOptions) == 2}
			{* If there's only one section, force it and skip the section parts
		   	of the interface. *}
			{foreach from=$sectionOptions item=val key=key}
				<div class="form-group">
					<div class="col-sm-10">
						<input type="hidden" name="sectionId" value="{$key|escape}" />
					</div>
				</div>
			{/foreach}
		{else}{* if count($sectionOptions) == 2 *}
			<div id="section">
				<div class="form-group">
					<div class="col-sm-10">
						<h3>{translate key="author.submit.journalSection"}</h3>
					</div>
				</div>
				{url|assign:"url" page="about"}
				<div class="form-group">
					<div class="col-sm-10">
						<p>{translate key="author.submit.journalSectionDescription" aboutUrl=$url}</p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<input type="hidden" name="submissionChecklist" value="1" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">{fieldLabel name="sectionId" required="true" key="section.section"}</label>
					<div class="col-sm-10">
						<select name="sectionId" id="sectionId" size="1" class="form-control">{html_options options=$sectionOptions selected=$sectionId}</select>
					</div>
				</div>
			</div>{* section *}
			<div class="form-group">
				<div class="separator"></div>
			</div>
		{/if}{* if count($sectionOptions) == 2 *}
		{if count($supportedSubmissionLocaleNames) == 1}
			{* There is only one supported submission locale; choose it invisibly *}
			{foreach from=$supportedSubmissionLocaleNames item=localeName key=locale}
				<div class="form-group">
					<div class="col-sm-10">
						<input type="hidden" name="locale" value="{$locale|escape}" />
					</div>
				</div>
			{/foreach}
		{else}
			{* There are several submission locales available; allow choice *}
			<div id="submissionLocale">
				<div class="form-group">
					<div class="col-sm-10">
						<h3>{translate key="author.submit.submissionLocale"}</h3>
					</div>
					<div class="col-sm-10">
						<p>{translate key="author.submit.submissionLocaleDescription"}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">{fieldLabel name="locale" required="true" key="article.language"}</label>
					<div class="col-sm-10">
						<select name="locale" id="locale" size="1" class="form-control">{html_options options=$supportedSubmissionLocaleNames selected=$locale}</select>
					</div>
				</div>
				<div class="form-group">
					<div class="separator"></div>
				</div>
			</div>{* submissionLocale *}
		{/if}{* count($supportedSubmissionLocaleNames) == 1 *}

		<script type="text/javascript">
		{literal}
		<!--
		function checkSubmissionChecklist() {
			var elements = document.getElementById('submit').elements;
			for (var i=0; i < elements.length; i++) {
				if (elements[i].type == 'checkbox' && !elements[i].checked) {
					if (elements[i].name.match('^checklist')) {
						alert({/literal}'{translate|escape:"jsparam" key="author.submit.verifyChecklist"}'{literal});
						return false;
					} else if (elements[i].name == 'copyrightNoticeAgree') {
						alert({/literal}'{translate|escape:"jsparam" key="author.submit.copyrightNoticeAgreeRequired"}'{literal});
						return false;
					}
				}
			}
			return true;
		}
		// -->
		{/literal}
		</script>

		{if $authorFees}
			{include file="author/submit/authorFees.tpl" showPayLinks=0}
			<div class="form-group">
				<div class="separator"></div>
			</div>
		{/if}

		{if $currentJournal->getLocalizedSetting('submissionChecklist')}
			{foreach name=checklist from=$currentJournal->getLocalizedSetting('submissionChecklist') key=checklistId item=checklistItem}
				{if $checklistItem.content}
					{if !$notFirstChecklistItem}
						{assign var=notFirstChecklistItem value=1}
						<div id="checklist">
							<div class="form-group">
								<div class="col-sm-10">
									<h3>{translate key="author.submit.submissionChecklist"}</h3>
								</div>
								<div class="col-sm-10">
									<p>{translate key="author.submit.submissionChecklistDescription"}</p>
								</div>
							</div>
					{/if}
					<div class="form-group">
						<div class="col-sm-10">
							<label class="emptyInputGroup btn-default">
								<input type="checkbox" id="checklist-{$smarty.foreach.checklist.iteration}" name="checklist[]" value="{$checklistId|escape}"{if $articleId || $submissionChecklist} checked="checked"{/if} /> {$checklistItem.content|nl2br}
							</label>
						</div>
					</div>
				{/if}
			{/foreach}
			{if $notFirstChecklistItem}
				</div>{* checklist *}
				<div class="form-group">
					<div class="separator"></div>
				</div>
			{/if}

	{/if}{* if count($sectionOptions) <= 1 *}

		{if $currentJournal->getLocalizedSetting('copyrightNotice') != ''}
			<div id="copyrightNotice">
				<div class="form-group">
					<div class="col-sm-10">
						<h3>{translate key="about.copyrightNotice"}</h3>
					</div>
					<div class="col-sm-10">
						<p>{$currentJournal->getLocalizedSetting('copyrightNotice')|nl2br}</p>
					</div>
				</div>
			{if $journalSettings.copyrightNoticeAgree}
				<div class="form-group">
					<div class="col-sm-10">
						<label class="emptyInputGroup btn-default">
							<input type="checkbox" name="copyrightNoticeAgree" id="copyrightNoticeAgree" value="1"{if $articleId || $copyrightNoticeAgree} checked="checked"{/if} /> {translate key="author.submit.copyrightNoticeAgree"}
						</label>
					</div>
				</div>
			{/if}{* $journalSettings.copyrightNoticeAgree *}
			</div>{* copyrightNotice *}
			<div class="form-group">
				<div class="separator"></div>
			</div>
		{/if}{* $currentJournal->getLocalizedSetting('copyrightNotice') != '' *}

		<div id="privacyStatement">
			<div class="form-group">
				<div class="col-sm-10">
					<h3>{translate key="author.submit.privacyStatement"}</h3>
				</div>
				<div class="col-sm-10">
					<p>{$currentJournal->getLocalizedSetting('privacyStatement')|nl2br}</p>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="separator"></div>
		</div>

		<div id="commentsForEditor">
			<div class="form-group">
				<div class="col-sm-10">
					<h3>{translate key="author.submit.commentsForEditor"}</h3>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label">{fieldLabel name="commentsToEditor" key="author.submit.comments"}</label>
				<div class="col-sm-10">
					<textarea name="commentsToEditor" id="commentsToEditor" rows="3" cols="40" class="form-control">{$commentsToEditor|escape}</textarea>
				</div>
			</div>
			

			<table width="100%" class="data">
			<tr valign="top">
				<td width="20%" class="label"></td>
				<td width="80%" class="value"></td>
			</tr>
			</table>
		</div>{* commentsForEditor *}

		<div class="form-group">
			<div class="separator"></div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-success" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger" onclick="{if $articleId}confirmAction('{url page="author"}', '{translate|escape:"jsparam" key="author.submit.cancelSubmission"}'){else}document.location.href='{url page="author" escape=false}'{/if}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
			</div>
		</div>
</form>

{/if}{* If not accepting submissions *}

{include file="common/footer.tpl"}

