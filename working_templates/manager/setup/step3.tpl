{**
 * templates/manager/setup/step3.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 3 of journal setup.
 *}
{assign var="pageTitle" value="manager.setup.guidingSubmissions"}
{include file="manager/setup/setupHeader.tpl"}

<form class="form-horizontal" name="setupForm" id="setupForm" method="post" action="{url op="saveSetup" path="3"}">
	{include file="common/formErrors.tpl"}

	{if count($formLocales) > 1}
	<div id="locale">
		<div class="form-group">
			<label class="control-label col-sm-2">{fieldLabel name="formLocale" key="form.formLanguage"}</label>
			<div class="col-sm-10">
				{url|assign:"setupFormUrl" op="setup" path="3" escape=false}
				{form_language_chooser form="setupForm" url=$setupFormUrl}
				<span class="instruct">{translate key="form.formLanguage.description"}</span>
			</div>
		</div>
	</div>
	{/if}

	<div id="authorGuidelinesInfo">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>3.1 {translate key="manager.setup.authorGuidelines"}</h3>

				<p>{translate key="manager.setup.authorGuidelinesDescription"}</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="authorGuidelines[{$formLocale|escape}]" id="authorGuidelines" rows="12" cols="60" class="form-control">{$authorGuidelines[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div>

	<div id="submissionPreparationChecklist">
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.submissionPreparationChecklist"}</h4>

				<p>{translate key="manager.setup.submissionPreparationChecklistDescription"}</p>
			</div>
		</div>

		{foreach name=checklist from=$submissionChecklist[$formLocale] key=checklistId item=checklistItem}
			{if !$notFirstChecklistItem}
				{assign var=notFirstChecklistItem value=1}
				<div class="form-group">
					<div class="col-sm-2">
						{translate key="common.order"}
					</div>
				</div>
			{/if}
				<div class="input-group col-sm-10">
					<div class="input-group-addon">
						<input type="text" name="submissionChecklist[{$formLocale|escape}][{$checklistId|escape}][order]" value="{$checklistItem.order|escape}" size="3" maxlength="2" class="textArea" />
					</div>
						<textarea name="submissionChecklist[{$formLocale|escape}][{$checklistId|escape}][content]" id="submissionChecklist-{$checklistId|escape}" rows="3" cols="30" class="form-control">{$checklistItem.content|escape}</textarea>
					<div class="input-group-addon">
						<input type="submit" name="delChecklist[{$checklistId|escape}]" value="{translate key="common.delete"}" class="btn btn-danger" />
					</div>
				</div>
				<div class="form-group"></div>
		{/foreach}
		<div class="form-group">
			<div class="col-sm-10">
				<input type="submit" name="addChecklist" value="{translate key="manager.setup.addChecklistItem"}" class="btn btn-info" />
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>

	<div id="permissions">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>3.2 {translate key="submission.permissions"}</h3>

				<h4>{translate key="manager.setup.authorCopyrightNotice"}</h4>
				{url|assign:"sampleCopyrightWordingUrl" page="information" op="sampleCopyrightWording"}
				<p>{translate key="manager.setup.authorCopyrightNoticeDescription" sampleCopyrightWordingUrl=$sampleCopyrightWordingUrl}</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="copyrightNotice[{$formLocale|escape}]" id="copyrightNotice" rows="12" cols="60" class="textArea">{$copyrightNotice[$formLocale]|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-4 formSubheading"><p>{translate key="submission.copyrightHolder"}</p></div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="radio" value="author" name="copyrightHolderType" {if $copyrightHolderType=="author"}checked="checked" {/if}id="copyrightHolderType-author" /> {translate key="user.role.author"}
				</label>
			</div>
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
				<input type="radio" value="journal" name="copyrightHolderType" {if $copyrightHolderType=="journal"}checked="checked" {/if}id="copyrightHolderType-journal" /> {translate key="journal.journal"}&nbsp;({$currentJournal->getLocalizedTitle()|escape})
			</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<div class="input-group">
					<div class="input-group-addon">
						<input type="radio" value="other" name="copyrightHolderType" {if $copyrightHolderType=="other"}checked="checked" {/if}id="copyrightHolderType-other" />&nbsp;<strong>{translate key="common.other"}</strong>
					</div>
					<input class="form-control" type="text" name="copyrightHolderOther[{$formLocale|escape}]" id="copyrightHolderOther" value="{$copyrightHolderOther[$formLocale]|escape}" />
				</div>
			</div>
		</div>
			

		<div class="form-group"></div>
		
		<div class="form-group">
			<div class="col-sm-6 formSubheading"><p>{translate key="manager.setup.copyrightYearBasis"}</p></div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="radio" value="issue" name="copyrightYearBasis" {if $copyrightYearBasis=="issue"}checked="checked" {/if}id="copyrightYearBasis-issue" />&nbsp;{translate key="issue.issue"} ({translate key="manager.setup.copyrightYearBasis.Issue"})
				</label>
			</div>
			<div class="col-sm-10">
				<label class=" emptyInputGroup btn-default">
					<input type="radio" value="article" name="copyrightYearBasis" {if $copyrightYearBasis=="article"}checked="checked" {/if}id="copyrightYearBasis-article" />&nbsp;{translate key="article.article"} ({translate key="manager.setup.copyrightYearBasis.Article"})
				</label>
			</div>
		</div>

		<div class="form-group"></div>

		<div class="form-group">
			<div class="col-sm-4 formSubheading"><p>{translate key="manager.setup.permissions.priorAgreement"}</p></div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="copyrightNoticeAgree" id="copyrightNoticeAgree" value="1"{if $copyrightNoticeAgree} checked="checked"{/if} />&nbsp;{translate key="manager.setup.authorCopyrightNoticeAgree"}
				</label>
			</div>
		</div>

		<div class="form-group"></div>

		<div class="form-group">
			<div class="col-sm-4 formSubheading"><p>{translate key="manager.setup.permissions.display"}</p></div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="includeCopyrightStatement" id="includeCopyrightStatement" value="1"{if $includeCopyrightStatement} checked="checked"{/if} />&nbsp;{translate key="manager.setup.includeCopyrightStatement"}
				</label>
			</div>
		</div>
		
		<div class="form-group"></div>
		<div class="form-group">
			<div class="col-sm-4 formSubheading"><p name="licenseURL">{translate key="submission.licenseURL"}</p></div>
		</div>
		<div class="form-group">
			<div class="col-sm-4">
				<select class="form-control" name="licenseURLSelect" id="licenseURLSelect" onchange="document.getElementById('licenseURL').value=document.getElementById('licenseURLSelect').options[document.getElementById('licenseURLSelect').selectedIndex].value; document.getElementById('licenseURL').readOnly=(document.getElementById('licenseURL').value==''?false:true);">
						{assign var=foundCc value=0}
						{foreach from=$ccLicenseOptions key=ccUrl item=ccNameKey}
							<option {if $licenseURL == $ccUrl}selected="selected" {/if}value="{$ccUrl|escape}">{$ccNameKey|translate}</option>
							{if $licenseURL == $ccUrl}
								{assign var=foundCc value=1}
							{/if}
						{/foreach}
						<option {if !$foundCc}selected="selected" {/if}value="">Other</option>
					</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-6">
			<input type="text" name="licenseURL" id="licenseURL" value="{$licenseURL|escape}" {if $foundCc}readonly="readonly" {/if}size="40" maxlength="255" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				{translate key="manager.setup.licenseURLDescription"}
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-4 formSubheading"><p>{translate key="manager.setup.permissions.display"}</p></div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default">
					<input type="checkbox" name="includeLicense" id="includeLicense" value="1"{if $includeLicense} checked="checked"{/if} />&nbsp;{translate key="manager.setup.includeLicense"}
				</label>
			</div>
		</div>	

		<div class="form-group"></div>

		<div class="form-group">
			<div class="col-sm-10">
				<p>{translate key="manager.setup.resetPermissions.description"}</p>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-10">
				<input name="resetPermissionsButton" id="resetPermissionsButton" type="button" value="{translate key="manager.setup.resetPermissions"}" class="btn btn-info" />
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>

	<div id="competingInterests">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>3.3 {translate key="manager.setup.competingInterests"}</h3>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<p>{translate key="manager.setup.competingInterests.description"}</p>
			</div>
		</div>
		<div class="form-group col-sm-12 formOptions">
			<div class="checkbox">
				<label>
					<input type="checkbox" name="requireAuthorCompetingInterests" id="requireAuthorCompetingInterests" value="1"{if $requireAuthorCompetingInterests} checked="checked"{/if} />&nbsp;{translate key="manager.setup.competingInterests.requireAuthors"}
				</label>
			</div>
			<div class="checkbox">
				<label>
					<input type="checkbox" name="requireReviewerCompetingInterests" id="requireReviewerCompetingInterests" value="1"{if $requireReviewerCompetingInterests} checked="checked"{/if} />&nbsp;{translate key="manager.setup.competingInterests.requireReviewers"}
				</label>
			</div>
		</div>	
		<div class="form-group">
			<div class="col-sm-10">
				<h4>{translate key="manager.setup.competingInterests.guidelines"}</h4>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<textarea name="competingInterestGuidelines[{$formLocale|escape}]" id="competingInterestGuidelines" rows="12" cols="60" class="form-control">{$competingInterestGuidelines[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>

	<div id="forAuthorsToIndexTheirWork">
		<div class="form-group">
			<div class="col-sm-10">
				<h3>3.4 {translate key="manager.setup.forAuthorsToIndexTheirWork"}</h3>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<p>{translate key="manager.setup.forAuthorsToIndexTheirWorkDescription"}</p>
			</div>
		</div>
		
		<div class="form-group col-sm-12">
			<h4 class="checkbox-inline">
				<input type="checkbox" name="metaDiscipline" id="metaDiscipline" value="1"{if $metaDiscipline} checked="checked"{/if} />{fieldLabel name="metaDiscipline" key="manager.setup.discipline"}
			</h4>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.disciplineDescription"}</span>
			</div>
		</div>
		<div class="form-group"></div>
		<div class="form-group formOptions">
			<label for="metaDisciplineExamples[{$formLocale|escape}]" class="col-sm-12">
				{translate key="manager.setup.disciplineProvideExamples"}:
			</label>
			<div class="col-sm-10">
				<input type="text" name="metaDisciplineExamples[{$formLocale|escape}]" id="metaDisciplineExamples" value="{$metaDisciplineExamples[$formLocale]|escape}" size="60" class="form-control" />
			</div>
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.disciplineExamples"}</span>
			</div>
		</div>

		<div class="form-group col-sm-12">
			<h4 class="checkbox-inline">
				<input type="checkbox" name="metaSubjectClass" id="metaSubjectClass" value="1"{if $metaSubjectClass} checked="checked"{/if} />{fieldLabel name="metaSubjectClass" key="manager.setup.subjectClassification"}
			</h4>
		</div>
		<div class="form-group formOptions">
			<label for="metaSubjectClassTitle[{$formLocale|escape}]" name="metaSubjectClassTitle" class="col-sm-10">{translate key="common.title"}</label>
			<div class="col-sm-10">
				<input type="text" name="metaSubjectClassTitle[{$formLocale|escape}]" id="metaSubjectClassTitle" value="{$metaSubjectClassTitle[$formLocale]|escape}" size="40" class="form-control" />
			</div>
		</div>
		<div class="form-group"></div>
		<div class="form-group formOptions">
			<label for="metaSubjectClassUrl[{$formLocale|escape}]" name="metaSubjectClassUrl" class="col-sm-10">{translate key="common.url"}</label>
			<div class="col-sm-10">
				<input type="text" name="metaSubjectClassUrl[{$formLocale|escape}]" id="metaSubjectClassUrl" value="{$metaSubjectClassUrl[$formLocale]|escape}" size="40" class="form-control" />
			</div>
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.subjectClassificationExamples"}</span>
			</div>
		</div>

		<div class="form-group col-sm-12">
			<h4 class="checkbox-inline">
				<input type="checkbox" name="metaSubject" id="metaSubject" value="1"{if $metaSubject} checked="checked"{/if} />{fieldLabel name="metaSubject" key="manager.setup.subjectKeywordTopic"}
			</h4>
		</div>
		<div class="form-group formOptions">
			<label for="metaSubjectExamples[{$formLocale|escape}]" class="col-sm-12">{translate key="manager.setup.subjectProvideExamples"}:</label>
			<div class="col-sm-10">
				<input type="text" name="metaSubjectExamples[{$formLocale|escape}]" id="metaSubjectExamples" value="{$metaSubjectExamples[$formLocale]|escape}" size="60" class="form-control" />
			</div>
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.subjectExamples"}</span>
			</div>
		</div>

		<div class="form-group col-sm-12">
			<h4 class="checkbox-inline">
				<input type="checkbox" name="metaCoverage" id="metaCoverage" value="1"{if $metaCoverage} checked="checked"{/if} />{fieldLabel name="metaCoverage" key="manager.setup.coverage"}
			</h4>
		</div>
		<div class="form-group formOptions">
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.coverageDescription"}</span><br/>
			</div>
		</div>

		<div class="form-group"></div>

		<div class="form-group formOptions">
			<label for="metaCoverageGeoExamples[{$formLocale|escape}]" class="col-sm-10">{translate key="manager.setup.coverageGeoProvideExamples"}:</label>
			<div class="col-sm-10">
				<input type="text" name="metaCoverageGeoExamples[{$formLocale|escape}]" id="metaCoverageGeoExamples" value="{$metaCoverageGeoExamples[$formLocale]|escape}" size="60" class="form-control" />
			</div>
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.coverageGeoExamples"}</span>
			</div>
		</div>

		<div class="form-group"></div>

		<div class="form-group formOptions">
			<label for="metaCoverageChronExamples[{$formLocale|escape}]" name="metaSubjectClassUrl" class="col-sm-10">{translate key="manager.setup.coverageChronProvideExamples"}:</label>
			<div class="col-sm-10">
				<input type="text" name="metaCoverageChronExamples[{$formLocale|escape}]" id="metaCoverageChronExamples" value="{$metaCoverageChronExamples[$formLocale]|escape}" size="60" class="form-control" />
			</div>
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.coverageChronExamples"}</span>
			</div>
		</div>

		<div class="form-group"></div>

		<div class="form-group formOptions">
			<label for="metaCoverageResearchSampleExamples[{$formLocale|escape}]" name="metaSubjectClassUrl" class="col-sm-10">{translate key="manager.setup.coverageResearchSampleProvideExamples"}:</label>
			<div class="col-sm-10">
				<input type="text" name="metaCoverageResearchSampleExamples[{$formLocale|escape}]" id="metaCoverageResearchSampleExamples" value="{$metaCoverageResearchSampleExamples[$formLocale]|escape}" size="60" class="form-control" />
			</div>
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.coverageResearchSampleExamples"}</span>
			</div>
		</div>

		<div class="form-group col-sm-12">
			<h4 class="checkbox-inline">
				<input type="checkbox" name="metaType" id="metaType" value="1"{if $metaType} checked="checked"{/if} />{fieldLabel name="metaType" key="manager.setup.typeMethodApproach"}
			</h4>
		</div>
		<div class="form-group formOptions">
			<label for="metaTypeExamples[{$formLocale|escape}]" class="col-sm-12">{translate key="manager.setup.typeProvideExamples"}:</label>
			<div class="col-sm-10">
				<input type="text" name="metaTypeExamples[{$formLocale|escape}]" id="metaTypeExamples" value="{$metaTypeExamples[$formLocale]|escape}" size="60" class="form-control" />
			</div>
			<div class="col-sm-12">
				<span class="instruct">{translate key="manager.setup.typeExamples"}</span>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>

	<div id="registerJournalForIndexing">
		<div class="form-group">
			<div class="col-sm-12">
				<h3>3.5 {translate key="manager.setup.registerJournalForIndexing"}</h3>
				{url|assign:"oaiUrl" page="oai"}
				<p>{translate key="manager.setup.registerJournalForIndexingDescription" oaiUrl=$oaiUrl siteUrl=$baseUrl}</p>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>

	<div id="notifications">
		<div class="form-group">
			<div class="col-sm-12">
				<h3>3.6 {translate key="manager.setup.notifications"}</h3>

				<p>{translate key="manager.setup.notifications.description"}</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<label class="emptyInputGroup btn-default" name="copySubmissionAckPrimaryContact">
					<input {if !$submissionAckEnabled}disabled="disabled" {/if}type="checkbox" name="copySubmissionAckPrimaryContact" id="copySubmissionAckPrimaryContact" value="true" {if $copySubmissionAckPrimaryContact}checked="checked"{/if}/> {translate key="manager.setup.notifications.copyPrimaryContact"}
				</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<div class="input-group">
					<div id="copySubmissionEmail" class="input-group-addon">
						<label name="copySubmissionAckAddress">
							<input {if !$submissionAckEnabled}disabled="disabled" {/if}type="checkbox" name="copySubmissionAckSpecified" id="copySubmissionAckSpecified" value="true" {if $copySubmissionAckSpecified}checked="checked"{/if}/> {translate key="manager.setup.notifications.copySpecifiedAddress"}
						</label>
					</div>
					<input {if !$submissionAckEnabled}disabled="disabled" {/if}type="text" class="form-control" id="copySubmissionAckAddress" name="copySubmissionAckAddress" value="{$copySubmissionAckAddress|escape}"/>
				</div>
			</div>
		</div>
		{if !$submissionAckEnabled}
			<div class="form-group">
				<div class="col-sm-12">
					{url|assign:"preparedEmailsUrl" op="emails"}
					{translate key="manager.setup.notifications.submissionAckDisabled" preparedEmailsUrl=$preparedEmailsUrl}
				</div>
			</div>
		{/if}
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>

	<div id="citationAssistant">
		<div class="form-group">
			<div class="col-sm-12">
				<h3>3.7 {translate key="manager.setup.citationAssistant"}</h3>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12">
				<a name="metaCitationEditing"></a>
				{if $citationEditorError}
					<p>{translate key=$citationEditorError}</p>
					</div>
					</div>
				{else}
					<p>{translate key="manager.setup.metaCitationsDescription"}</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<label class="emptyInputGroup btn-default" for="metaCitations">
								<input type="checkbox" name="metaCitations" id="metaCitations" value="1"{if $metaCitations} checked="checked"{/if} /> {translate key="manager.setup.citations"}
							</label>
						</div>
					</div>
					<div id="citationFilterSetupToggle" {if !$metaCitations}style="visible: none"{/if}>
						<div class="form-group">
							<div class="col-sm-12">
								<h4>{translate key="manager.setup.citationFilterParser"}</h4>
								<p>{translate key="manager.setup.citationFilterParserDescription"}</p>
								{load_url_in_div id="parserFilterGridContainer" loadMessageId="manager.setup.filter.parser.grid.loadMessage" url="$parserFilterGridUrl"}

								<h4>{translate key="manager.setup.citationFilterLookup"}</h4>
								<p>{translate key="manager.setup.citationFilterLookupDescription"}</p>
								{load_url_in_div id="lookupFilterGridContainer" loadMessageId="manager.setup.filter.lookup.grid.loadMessage" url="$lookupFilterGridUrl"}
								<h4>{translate key="manager.setup.citationOutput"}</h4>
								<p>{translate key="manager.setup.citationOutputStyleDescription"}</p>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								{fbvElement class="form-control" type="select" id="metaCitationOutputFilterSelect" name="metaCitationOutputFilterId"
										from=$metaCitationOutputFilters translate=false selected=$metaCitationOutputFilterId|escape
										defaultValue="-1" defaultLabel="manager.setup.filter.pleaseSelect"|translate}
							</div>
						</div>
					</div>

					{literal}<script type='text/javascript'>
						$(function(){
							// jQuerify DOM elements
							$metaCitationsCheckbox = $('#metaCitations');
							$metaCitationsSetupBox = $('#citationFilterSetupToggle');

							// Set the initial state
							initialCheckboxState = $metaCitationsCheckbox.attr('checked');
							if (initialCheckboxState) {
								$metaCitationsSetupBox.css('display', 'block');
							} else {
								$metaCitationsSetupBox.css('display', 'none');
							}

							// Toggle the settings box.
							// NB: Has to be click() rather than change() to work in IE.
							$metaCitationsCheckbox.click(function(){
								checkboxState = $metaCitationsCheckbox.attr('checked');
								toggleState = ($metaCitationsSetupBox.css('display') === 'block');
								if (checkboxState !== toggleState) {
									$metaCitationsSetupBox.toggle(300);
								}
							});
						});
						
						function permissionsValues() {
							perm = ':';
							licenseNames = ["copyrightYearBasis", "copyrightHolderType"];
							for (l = 0; l < licenseNames.length; l++) {
								ele = document.getElementsByName(licenseNames[l]);
								for (i = 0; i < ele.length; i++) {
									if (ele[i].type == 'radio') {
										if (ele[i].checked) {
											perm += ele[i].value + ':';
											break;
										}
									} else {
										perm += ele[i].value + ':';
									}
								}
							};
							licenseIds = ["copyrightHolderOther", "licenseURL"];
							for (l = 0; l < licenseIds.length; l++) {
								ele = document.getElementById(licenseIds[l]);
								if (ele) {
									perm += ele.value + ':';
								}
							}
							return perm;
						}
						var resetValues;
						$(document).ready( function () {
							resetValues = permissionsValues();
							$('#resetPermissionsButton').click( function ( event ) {
								if (resetValues == permissionsValues()) {
									{/literal}
									confirmAction('{url op="resetPermissions"}', '{translate|escape:"jsparam" key="manager.setup.confirmResetLicense"}');
									{literal}
								} else {
									{/literal}
									window.alert('{translate|escape:"jsparam" key="manager.setup.confirmResetLicenseChanged"}')
									{literal}
								}
								event.preventDefault();
							});
						});
					</script>{/literal}
				{/if}
	</div>

	<div class="form-group">
		<div class="separator"></div>
	</div>
	<div class="form-group">
		<div class="col-sm-12">
			<input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-success" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-danger" onclick="document.location.href='{url op="setup" escape=false}'" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-12">
			<span class="formRequired">{translate key="common.requiredField"}</span>
		</div>
	</div>

</form>

{include file="common/footer.tpl"}
