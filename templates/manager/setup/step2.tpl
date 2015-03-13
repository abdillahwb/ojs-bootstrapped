{**
 * templates/manager/setup/step2.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 2 of journal setup.
 *
 *}
{assign var="pageTitle" value="manager.setup.journalPolicies"}
{include file="manager/setup/setupHeader.tpl"}

<form id="setupForm" class="form-horizontal" method="post" action="{url op="saveSetup" path="2"}">
	{include file="common/formErrors.tpl"}

	{if count($formLocales) > 1}
		<div id="locales">
			<div class="form-group">
				<label for="" class="control-label col-sm-2">{fieldLabel name="formLocale" key="form.formLanguage"}</label>
				<div class="col-sm-10">
					{url|assign:"setupFormUrl" op="setup" path="2" escape=false}
					{form_language_chooser form="setupForm" url=$setupFormUrl}
					<span class="instruct">{translate key="form.formLanguage.description"}</span>
				</div>
			</div>
		</div>
	{/if}
	<h3>2.1 {translate key="manager.setup.focusAndScopeOfJournal"}</h3>
	<div class="form-group" id="focusAndScopeDescription">
		<div class="col-sm-10">
			<p for="focusScopeDesc">{translate key="manager.setup.focusAndScopeDescription"}</p>
		</div>
		<div class="col-sm-10">
			<textarea name="focusScopeDesc[{$formLocale|escape}]" id="focusScopeDesc"  class="form-control">{$focusScopeDesc[$formLocale]|escape}</textarea>
		</div>
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>

	<h3>2.2 {translate key="manager.setup.peerReviewPolicy"}</h3>
	<div id="peerReviewPolicy">
		<div class="form-group" id="peerReviewDescription">
			<div class="col-sm-10">
				<p>{translate key="manager.setup.peerReviewDescription"}</p>

				<h4>{translate key="manager.setup.reviewPolicy"}</h4>
			</div>
			<div class="col-sm-10">
				<textarea name="reviewPolicy[{$formLocale|escape}]" id="reviewPolicy" rows="12" cols="60" class="form-control">{$reviewPolicy[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div class="form-group" id="reviewGuidelinesInfo">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.reviewGuidelines"}</h4>

				{url|assign:"reviewFormsUrl" op="reviewForms"}
				<p>{translate key="manager.setup.reviewGuidelinesDescription" reviewFormsUrl=$reviewFormsUrl}</p>
			</div>
			<div class="col-sm-10">
				<textarea name="reviewGuidelines[{$formLocale|escape}]" id="reviewGuidelines" rows="12" cols="60" class="form-control">{$reviewGuidelines[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div id="reviewProcess">
			<div class="form-group">
				<div class="col-sm-10">
					<h4>{translate key="manager.setup.reviewProcess"}</h4>

					<p>{translate key="manager.setup.reviewProcessDescription"}</p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="radio">
						<label>
							<input type="radio" name="mailSubmissionsToReviewers" id="mailSubmissionsToReviewers-0" value="0"{if not $mailSubmissionsToReviewers} checked="checked"{/if} /><strong>{translate key="manager.setup.reviewProcessStandard"}</strong><br>
							<span class="instruct">{translate key="manager.setup.reviewProcessStandardDescription"}</span>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="separator"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="radio">
						<label>
							<input type="radio" name="mailSubmissionsToReviewers" id="mailSubmissionsToReviewers-1" value="1"{if $mailSubmissionsToReviewers} checked="checked"{/if} /><strong>{translate key="manager.setup.reviewProcessEmail"}</strong><br>
							<span class="instruct">{translate key="manager.setup.reviewProcessEmailDescription"}</span>
						</label>
					</div>
				</div>
			</div>
		</div>
		<div id="reviewOptions">
			<div class="form-group">
				<div class="col-sm-10">
					<h4>{translate key="manager.setup.reviewOptions"}</h4>
				</div>
			</div>

			<script type="text/javascript">
				{literal}
				<!--
					function toggleAllowSetInviteReminder(form) {
						form.numDaysBeforeInviteReminder.disabled = !form.numDaysBeforeInviteReminder.disabled;
					}
					function toggleAllowSetSubmitReminder(form) {
						form.numDaysBeforeSubmitReminder.disabled = !form.numDaysBeforeSubmitReminder.disabled;
					}
				// -->
				{/literal}
			</script>
			<div class="form-group">
				<div class="col-sm-10">
					<label for="numWeeksPerReview" class="control-label">
						{translate key="manager.setup.reviewOptions.reviewTime"}
					</label>
				</div>
				<div class="col-sm-10">
						{translate key="manager.setup.reviewOptions.numWeeksPerReview"} ({translate key="common.weeks"}):
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2">
					 <input class="form-control" type="text" name="numWeeksPerReview" id="numWeeksPerReview" value="{$numWeeksPerReview|escape}" size="2" maxlength="8" class="textField" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<p>
						{translate key="common.note"}: {translate key="manager.setup.reviewOptions.noteOnModification"}
					</p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<strong>{translate key="manager.setup.reviewOptions.reviewerReminders"}</strong><br>
					{translate key="manager.setup.reviewOptions.automatedReminders"}:
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="remindForInvite" id="remindForInvite" value="1" onclick="toggleAllowSetInviteReminder(this.form)"{if !$scheduledTasksEnabled} disabled="disabled" {elseif $remindForInvite} checked="checked"{/if} />{translate key="manager.setup.reviewOptions.remindForInvite1"} ({translate key="manager.setup.reviewOptions.remindForInvite2"})
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2">
					<select name="numDaysBeforeInviteReminder" size="1" class="form-control"{if not $remindForInvite || !$scheduledTasksEnabled} disabled="disabled"{/if}>
						{section name="inviteDayOptions" start=3 loop=11}
							<option value="{$smarty.section.inviteDayOptions.index}"{if $numDaysBeforeInviteReminder eq $smarty.section.inviteDayOptions.index or ($smarty.section.inviteDayOptions.index eq 5 and not $remindForInvite)} selected="selected"{/if}>{$smarty.section.inviteDayOptions.index}</option>
						{/section}
					</select>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="remindForSubmit" id="remindForSubmit" value="1" onclick="toggleAllowSetSubmitReminder(this.form)"{if !$scheduledTasksEnabled} disabled="disabled"{elseif $remindForSubmit} checked="checked"{/if} />{translate key="manager.setup.reviewOptions.remindForSubmit1"} <strong>(X)</strong> {translate key="manager.setup.reviewOptions.remindForSubmit2"}
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-2">
					<select name="numDaysBeforeSubmitReminder" size="1" class="form-control"{if not $remindForSubmit || !$scheduledTasksEnabled} disabled="disabled"{/if}>
						{section name="submitDayOptions" start=0 loop=11}
							<option value="{$smarty.section.submitDayOptions.index}"{if $numDaysBeforeSubmitReminder eq $smarty.section.submitDayOptions.index} selected="selected"{/if}>{$smarty.section.submitDayOptions.index}</option>
						{/section}
					</select>
				</div>
			</div>
			{if !$scheduledTasksEnabled}
				<div class="form-group">
					<div class="col-sm-10">
						{translate key="manager.setup.reviewOptions.automatedRemindersDisabled"}
					</div>
				</div>
			{/if}

			<div class="form-group">
				<div class="col-sm-10">
					<strong>{translate key="manager.setup.reviewOptions.reviewerRatings"}</strong>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="rateReviewerOnQuality" id="rateReviewerOnQuality" value="1"{if $rateReviewerOnQuality} checked="checked"{/if} />{translate key="manager.setup.reviewOptions.onQuality"}
						</label>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-10">
					<strong>{translate key="manager.setup.reviewOptions.reviewerAccess"}</strong>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="reviewerAccessKeysEnabled" id="reviewerAccessKeysEnabled" value="1"{if $reviewerAccessKeysEnabled} checked="checked"{/if} />{translate key="manager.setup.reviewOptions.reviewerAccessKeysEnabled"}
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<p>{translate key="manager.setup.reviewOptions.reviewerAccessKeysEnabled.description"}</p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="restrictReviewerFileAccess" id="restrictReviewerFileAccess" value="1"{if $restrictReviewerFileAccess} checked="checked"{/if} />{translate key="manager.setup.reviewOptions.restrictReviewerFileAccess"}
						</label>
					</div>
				</div>
			</div>	
			
			<div class="form-group">
				<div class="col-sm-10">
					<strong>{translate key="manager.setup.reviewOptions.blindReview"}</strong>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="checkbox">
						<label>
							<input type="checkbox" name="showEnsuringLink" id="showEnsuringLink" value="1"{if $showEnsuringLink} checked="checked"{/if} />{translate key="manager.setup.reviewOptions.reviewerAccessKeysEnabled"} {get_help_id|assign:"blindReviewHelpId" key="editorial.sectionEditorsRole.review.blindPeerReview" url="true"}{translate key="manager.setup.reviewOptions.showEnsuringLink" blindReviewHelpId=$blindReviewHelpId}
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10 separator"></div>
	</div>
	<div id="privacyStatementInfo">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>2.3 {translate key="manager.setup.privacyStatement"}</h3>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="privacyStatement[{$formLocale|escape}]" id="privacyStatement" rows="12" cols="60" class="form-control">{$privacyStatement[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-10 separator"></div>
	</div>

	<div id="editorDecision">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>2.4 {translate key="manager.setup.editorDecision"}</h3>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<div class="checkbox">
					<label>
						<input type="checkbox" name="notifyAllAuthorsOnDecision" id="notifyAllAuthorsOnDecision" value="1"{if $notifyAllAuthorsOnDecision} checked="checked"{/if} />{translate key="manager.setup.notifyAllAuthorsOnDecision"}
					</label>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-10 separator"></div>
	</div>

	<div id="addItemtoAboutJournal">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>2.5 {translate key="manager.setup.addItemtoAboutJournal"}</h3>
			</div>
		</div>
		{foreach name=customAboutItems from=$customAboutItems[$formLocale] key=aboutId item=aboutItem}
			<div class="form-group">
				<label for="customAboutItems-{$aboutId|escape}-title" class=" col-sm-2">{fieldLabel name="customAboutItems-$aboutId-title" key="common.title"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input class="form-control" type="text" name="customAboutItems[{$formLocale|escape}][{$aboutId|escape}][title]" id="customAboutItems-{$aboutId|escape}-title" value="{$aboutItem.title|escape}" size="40" maxlength="255" />{if $smarty.foreach.customAboutItems.total > 1} <input class="btn btn-danger" type="submit" name="delCustomAboutItem[{$aboutId|escape}]" value="{translate key="common.delete"}" class="button" />{/if}
				</div>
			</div>
			<div class="form-group">
				<label for="customAboutItems-{$aboutId|escape}-content" class=" col-sm-2">{fieldLabel name="customAboutItems-$aboutId-content" key="manager.setup.aboutItemContent"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<textarea name="customAboutItems[{$formLocale|escape}][{$aboutId|escape}][content]" id="customAboutItems-{$aboutId|escape}-content" rows="12" cols="40" class="form-control">{$aboutItem.content|escape}</textarea>
				</div>
			</div>
			{if !$smarty.foreach.customAboutItems.last}
				<div class="form-group">
					<div class="col-sm-10 separator"></div>
				</div>
			{/if}
		{foreachelse}
			<div class="form-group">
				<label for="customAboutItems[{$formLocale|escape}][0][title]" class=" col-sm-2">{fieldLabel name="customAboutItems-0-title" key="common.title"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input class="form-control" type="text" name="customAboutItems[{$formLocale|escape}][0][title]" id="customAboutItems-0-title" value="" size="40" maxlength="255" />
				</div>
			</div>
			<div class="form-group">
				<label for="customAboutItems[{$formLocale|escape}][0][content]" class=" col-sm-2">{fieldLabel name="customAboutItems-0-content" key="manager.setup.aboutItemContent"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<textarea name="customAboutItems[{$formLocale|escape}][0][content]" id="customAboutItems-0-content" rows="12" cols="40" class="form-control"></textarea>
				</div>
			</div>
		{/foreach}
		<div class="form-group">
			<div class="col-sm-10">
				<input class="btn btn-info" type="submit" name="addCustomAboutItem" value="{translate key="manager.setup.addAboutItem"}" class="button" />
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-10 separator"></div>
	</div>

	<div id="journalArchiving">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>2.6 {translate key="manager.setup.journalArchiving"}</h3>

				<p>{translate key="manager.setup.preservationDescription"}</p>

				{call_hook name="Templates::Manager::Setup::JournalArchiving"}

				<p>{translate key="manager.setup.lockssDescription" lockssExistingArchiveUrl=$lockssExistingArchiveUrl lockssNewArchiveUrl=$lockssNewArchiveUrl}</p>

				{url|assign:"lockssUrl" page="gateway" op="lockss"}
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<div class="checkbox">
					<label>
						<input type="checkbox" name="enableLockss" id="enableLockss" value="1"{if $enableLockss} checked="checked"{/if} />{translate key="manager.setup.lockssEnable" lockssUrl=$lockssUrl}
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="lockssLicense[{$formLocale|escape}]" id="lockssLicense" rows="6" cols="60" class="form-control">{$lockssLicense[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<span class="instruct">{translate key="manager.setup.lockssLicenses"}</span>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-10 separator"></div>
	</div>

	<div id="reviewerDatabaseLink">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>2.7 {translate key="manager.setup.reviewerDatabaseLink"}</h3>

				<p>{translate key="manager.setup.reviewerDatabaseLink.desc"}</p>
			</div>
		</div>
		{foreach name=reviewerDatabaseLinks from=$reviewerDatabaseLinks key=reviewerDatabaseLinkId item=reviewerDatabaseLink}
			<div class="form-group">
				<label for="" class="col-sm-2">{fieldLabel name="reviewerDatabaseLinks-$reviewerDatabaseLinkId-title" key="common.title"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input class="form-control" type="text" name="reviewerDatabaseLinks[{$reviewerDatabaseLinkId|escape}][title]" id="reviewerDatabaseLinks-{$reviewerDatabaseLinkId|escape}-title" value="{$reviewerDatabaseLink.title|escape}" size="40" maxlength="255" />{if $smarty.foreach.reviewerDatabaseLinks.total > 1} <input class="form-control" type="submit" name="delReviewerDatabaseLink[{$reviewerDatabaseLinkId|escape}]" value="{translate key="common.delete"}" class="btn btn-danger" />{/if}
				</div>
			</div>
			<div class="form-group">
				<label for="" class=" col-sm-2">{fieldLabel name="reviewerDatabaseLinks-$reviewerDatabaseLinkId-url" key="common.url"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input class="form-control" type="text" name="reviewerDatabaseLinks[{$reviewerDatabaseLinkId|escape}][url]" id="reviewerDatabaseLinks-{$reviewerDatabaseLinkId|escape}-url" value="{$reviewerDatabaseLink.url|escape}" size="40" maxlength="255" />
				</div>
			</div>
			{if !$smarty.foreach.reviewerDatabaseLinks.last}
				<div class="form-group">
					<div class="col-sm-10 separator"></div>
				</div>
			{/if}
		{foreachelse}
			<div class="form-group">
				<label for="" class=" col-sm-2">{fieldLabel name="reviewerDatabaseLinks-0-title" key="common.title"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input class="form-control" type="text" name="reviewerDatabaseLinks[0][title]" id="reviewerDatabaseLinks-0-title" value="" size="40" maxlength="255" />
				</div>
			</div>
			<div class="form-group">
				<label for="" class=" col-sm-2">{fieldLabel name="reviewerDatabaseLinks-0-url" key="common.url"}</label>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<input class="form-control" type="text" name="reviewerDatabaseLinks[0][url]" id="reviewerDatabaseLinks-0-url" value="" size="40" maxlength="255" />
				</div>
			</div>
		{/foreach}

		<div class="form-group">
			<div class="col-sm-10">
				<input type="submit" name="addReviewerDatabaseLink" value="{translate key="manager.setup.addReviewerDatabaseLink"}" class="btn btn-info" />
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-10 separator"></div>
	</div>

	<div class="form-group">
		<div class="col-sm-10">
			<input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-success" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger" onclick="document.location.href='{url op="setup" escape=false}'" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-10">
			<span class="formRequired">{translate key="common.requiredField"}</span>
		</div>
	</div>
</form>

{include file="common/footer.tpl"}

