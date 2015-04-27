{**
 * templates/manager/setup/step1.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2003-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 1 of journal setup.
 *
 *}
{assign var="pageTitle" value="manager.setup.gettingDownTheDetails"}
{include file="manager/setup/setupHeader.tpl"}

<form id="setupForm" class="form-horizontal" method="post" action="{url op="saveSetup" path="1"}">
	{include file="common/formErrors.tpl"}

	{if count($formLocales) > 1}
	<div id="locales">
		<div class="form-group">
			<label for="" class="col-sm-2 control-label">{fieldLabel name="formLocale" key="form.formLanguage"}</label>
			<div class="col-sm-10">
				{url|assign:"setupFormUrl" op="setup" path="1" escape=false}
				{form_language_chooser form="setupForm" url=$setupFormUrl}
				<span class="instruct">{translate key="form.formLanguage.description"}</span>
			</div>
		</div>
	</div>
	{/if}
	<div id="generalInformation">
	<h3>1.1 {translate key="manager.setup.generalInformation"}</h3>
		<div class="form-group">
			<label for="title" class="col-sm-2 control-label">{fieldLabel name="title" required="true" key="manager.setup.journalTitle"}</label>
			<div class="col-sm-10">
				<input type="text" name="title[{$formLocale|escape}]" id="title" value="{$title[$formLocale]|escape}" size="40" maxlength="120" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="initials" class="col-sm-2 control-label">{fieldLabel name="initials" required="true" key="manager.setup.journalInitials"}</label>
			<div class="col-sm-10">
				<input type="text" name="initials[{$formLocale|escape}]" id="initials" value="{$initials[$formLocale]|escape}" size="8" maxlength="16" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="abbreviation" class="col-sm-2 control-label">{fieldLabel name="abbreviation" key="manager.setup.journalAbbreviation"}</label>
			<div class="col-sm-10">
				<input type="text" name="abbreviation[{$formLocale|escape}]" id="abbreviation" value="{$abbreviation[$formLocale]|escape}" size="40" maxlength="120" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="printIssn" class="col-sm-2 control-label">{fieldLabel name="printIssn" key="manager.setup.printIssn"}</label>
			<div class="col-sm-10">
				<input type="text" name="printIssn" id="printIssn" value="{$printIssn|escape}" size="8" maxlength="16" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="onlineIssn" class="col-sm-2 control-label">{fieldLabel name="onlineIssn" key="manager.setup.onlineIssn"}</label>
			<div class="col-sm-10">
				<input type="text" name="onlineIssn" id="onlineIssn" value="{$onlineIssn|escape}" size="8" maxlength="16" class="form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-10">
				<button class="btn btn-info" type="button" data-toggle="collapse" data-target="#issnInfo" aria-expanded="false">ISSN Info</button>
			</div>
			<div id="issnInfo" class="col-sm-10 collapse"><br>{translate key="manager.setup.issnDescription"}</div>
		</div>

		<div class="form-group">
			<label for="mailingAddress" class="col-sm-2 control-label">{fieldLabel name="mailingAddress" key="common.mailingAddress"}</label>
			<div class="col-sm-10">
				<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="form-control">{$mailingAddress|escape}</textarea>
			</div>
			<div class="col-sm-10">
				<span class="instruct">{translate key="manager.setup.mailingAddressDescription"}</span>
			</div>
		</div>
		{if $categoriesEnabled}
			<div class="form-group">
				<td class="label">{fieldLabel name=categories key="manager.setup.categories"}</td>
				<td class="value">
					<select id="categories" name="categories[]" class="selectMenu" multiple="multiple">
						{html_options options=$allCategories selected=$categories}
					</select>
					<br/>
					{translate key="manager.setup.categories.description"}
				</td>
			</div>
		{/if}{* $categoriesEnabled *} 
	</div>

	<div class="separator"></div>

	<div id="principalContact">
		<h3>1.2 {translate key="manager.setup.principalContact"}</h3>

		<p>{translate key="manager.setup.principalContactDescription"}</p>

		<div class="form-group">
			<label for="contactName" class="col-sm-2 control-label">{fieldLabel name="contactName" key="user.name" required="true"}</label>
			<div class="col-sm-10">
				<input type="text" name="contactName" id="contactName" value="{$contactName|escape}" size="30" maxlength="60" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="contactTitle" class="col-sm-2 control-label">{fieldLabel name="contactTitle" key="user.title"}</label>
			<div class="col-sm-10">
				<input type="text" name="contactTitle[{$formLocale|escape}]" id="contactTitle" value="{$contactTitle[$formLocale]|escape}" size="30" maxlength="90" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="contactEmail" class="col-sm-2 control-label">{fieldLabel name="contactEmail" key="user.email" required="true"}</label>
			<div class="col-sm-10">
				<input type="text" name="contactEmail" id="contactEmail" value="{$contactEmail|escape}" size="30" maxlength="90" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="contactPhone" class="col-sm-2 control-label">{fieldLabel name="contactPhone" key="user.phone"}</label>
			<div class="col-sm-10">
				<input type="text" name="contactPhone" id="contactPhone" value="{$contactPhone|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="contactFax" class="col-sm-2 control-label">{fieldLabel name="contactFax" key="user.fax"}</label>
			<div class="col-sm-10">
				<input type="text" name="contactFax" id="contactFax" value="{$contactFax|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="contactAffiliation" class="col-sm-2 control-label">{fieldLabel name="contactAffiliation" key="user.affiliation"}</label>
			<div class="col-sm-10">
				<textarea name="contactAffiliation[{$formLocale|escape}]" id="contactAffiliation" rows="5" cols="40" class="form-control">{$contactAffiliation[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="contactMailingAddress" class="col-sm-2 control-label">{fieldLabel name="contactMailingAddress" key="common.mailingAddress"}</label>
			<div class="col-sm-10">
				<textarea name="contactMailingAddress[{$formLocale|escape}]" id="contactMailingAddress" rows="3" cols="40" class="form-control">{$contactMailingAddress[$formLocale]|escape}</textarea>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="technicalSupportContact">
		<h3>1.3 {translate key="manager.setup.technicalSupportContact"}</h3>

		<p>{translate key="manager.setup.technicalSupportContactDescription"}</p>

		<div class="form-group">
			<label for="supportName" class="col-sm-2 control-label">{fieldLabel name="supportName" key="user.name" required="true"}</label>
			<div class="col-sm-10">
				<input type="text" name="supportName" id="supportName" value="{$supportName|escape}" size="30" maxlength="60" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="supportEmail" class="col-sm-2 control-label">{fieldLabel name="supportEmail" key="user.email" required="true"}</label>
			<div class="col-sm-10">
				<input type="text" name="supportEmail" id="supportEmail" value="{$supportEmail|escape}" size="30" maxlength="90" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="supportPhone" class="col-sm-2 control-label">{fieldLabel name="supportPhone" key="user.phone"}</label>
			<div class="col-sm-10">
				<input type="text" name="supportPhone" id="supportPhone" value="{$supportPhone|escape}" size="15" maxlength="24" class="form-control" />
			</div>
			</div>
	</div>
	<div class="separator"></div>
	<div id="setupEmails">
		<h3>1.4 {translate key="manager.setup.emails"}</h3>
		<p>{translate key="manager.setup.emailSignatureDescription"}</p>
		<div class="form-group">
			<label for="emailSignature" class="col-sm-2 control-label">{fieldLabel name="emailSignature" key="manager.setup.emailSignature"}</label>
			<div class="col-sm-10">
				<textarea name="emailSignature" id="emailSignature" rows="3" cols="60" class="form-control">{$emailSignature|escape}</textarea>
			</div>
		</div>
		<p>{translate key="manager.setup.emailBounceAddressDescription"}</p>
		<div class="form-group">
			<label for="envelopeSender" class="col-sm-2 control-label">{fieldLabel name="envelopeSender" key="manager.setup.emailBounceAddress"}</label>
			<div class="col-sm-10">
				<input type="text" name="envelopeSender" id="envelopeSender" size="40" maxlength="255" class="form-control" {if !$envelopeSenderEnabled}disabled="disabled" value=""{else}value="{$envelopeSender|escape}"{/if} />
			</div>
			{if !$envelopeSenderEnabled}
				<div class="col-sm-10">
					<p class="instruct">{translate key="manager.setup.emailBounceAddressDisabled"}</p>
				</div>
			{/if}
		</div>
	</div>

	<div class="separator"></div>
	<div id="setupPublisher">
		<h3>1.5 {translate key="manager.setup.publisher"}</h3>

		<p>{translate key="manager.setup.publisherDescription"}</p>

		<div class="form-group">
			<label for="publisherNote" class="col-sm-2 control-label">{fieldLabel name="publisherNote" key="manager.setup.note"}</label>
			<div class="col-sm-10">
				<textarea name="publisherNote[{$formLocale|escape}]" id="publisherNote" rows="5" cols="40" class="form-control">{$publisherNote[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="publisherInstitution" class="col-sm-2 control-label">{fieldLabel name="publisherInstitution" key="manager.setup.institution"}</label>
			<div class="col-sm-10">
				<input type="text" name="publisherInstitution" id="publisherInstitution" value="{$publisherInstitution|escape}" size="40" maxlength="90" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="publisherUrl" class="col-sm-2 control-label">{fieldLabel name="publisherUrl" key="common.url"}</label>
			<div class="col-sm-10">
				<input type="text" name="publisherUrl" id="publisherUrl" value="{$publisherUrl|escape}" size="40" maxlength="255" class="form-control" />
			</div>
		</div>
	</div>
	<div class="separator"></div>
	<div id="sponsors">
	<h3>1.6 {translate key="manager.setup.sponsors"}</h3>

	<p>{translate key="manager.setup.sponsorsDescription"}</p>

		<div class="form-group">
			<label for="sponsorNote" class="col-sm-2 control-label">{fieldLabel name="sponsorNote" key="manager.setup.note"}</label>
			<div class="col-sm-10">
				<textarea name="sponsorNote[{$formLocale|escape}]" id="sponsorNote" rows="5" cols="40" class="form-control">{$sponsorNote[$formLocale]|escape}</textarea>
			</div>
		</div>
	{foreach name=sponsors from=$sponsors key=sponsorId item=sponsor}
		<div class="form-group">
			<label for="sponsors-{$sponsorId|escape}-institution" class="col-sm-2 control-label">{fieldLabel name="sponsors-$sponsorId-institution" key="manager.setup.institution"}</label>
			<div class="col-sm-10">
				<input type="text" name="sponsors[{$sponsorId|escape}][institution]" id="sponsors-{$sponsorId|escape}-institution" value="{$sponsor.institution|escape}" size="40" maxlength="90" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="sponsors-{$sponsorId|escape}-url" class="col-sm-2 control-label">{fieldLabel name="sponsors-$sponsorId-url" key="common.url"}</label>
			<div class="col-sm-10">
				<input type="text" name="sponsors[{$sponsorId|escape}][url]" id="sponsors-{$sponsorId|escape}-url" value="{$sponsor.url|escape}" size="40" maxlength="255" class="form-control" />{if $smarty.foreach.sponsors.total > 1} <input type="submit" name="delSponsor[{$sponsorId|escape}]" value="{translate key="common.delete"}" class="btn btn-danger" />{/if}
			</div>
		</div>
		{if !$smarty.foreach.sponsors.last}
		<div class="form-group">
			<div class="separator">&nbsp;</div>
		</div>
		{/if}
		{foreachelse}
			<div class="form-group">
				<label for="sponsors[0][institution]" class="col-sm-2 control-label">{fieldLabel name="sponsors-0-institution" key="manager.setup.institution"}</label>
				<div class="col-sm-10">
					<input type="text" name="sponsors[0][institution]" id="sponsors-0-institution" size="40" maxlength="90" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label for="sponsors[0][url]" class="col-sm-2 control-label">{fieldLabel name="sponsors-0-url" key="common.url"}</label>
				<div class="col-sm-10">
					<input type="text" name="sponsors[0][url]" id="sponsors-0-url" size="40" maxlength="255" class="form-control" />
				</div>
			</div>
		{/foreach}
		<div class="form-group">
			<div class="col-sm-10">
				<input type="submit" name="addSponsor" value="{translate key="manager.setup.addSponsor"}" class="btn btn-info" />
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="contributors">
		<h3>1.7 {translate key="manager.setup.contributors"}</h3>

		<p>{translate key="manager.setup.contributorsDescription"}</p>

		<div class="form-group">
			<label for="contributorNote" class="col-sm-2 control-label">{fieldLabel name="contributorNote" key="manager.setup.note"}</label>
			<div class="col-sm-10">
				<textarea name="contributorNote[{$formLocale|escape}]" id="contributorNote" rows="5" cols="40" class="form-control">{$contributorNote[$formLocale]|escape}</textarea>
			</div>
		</div>
		{foreach name=contributors from=$contributors key=contributorId item=contributor}
		<div class="form-group">
			<label for="contributors-{$contributorId|escape}-name" class="col-sm-2 control-label">{fieldLabel name="contributors-$contributorId-name" key="manager.setup.contributor"}</label>
			<div class="col-sm-10">
				<input type="text" name="contributors[{$contributorId|escape}][name]" id="contributors-{$contributorId|escape}-name" value="{$contributor.name|escape}" size="40" maxlength="90" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="contributors-{$contributorId|escape}-url" class="col-sm-2 control-label">{fieldLabel name="contributors-$contributorId-url" key="common.url"}</label>
			<div class="col-sm-10">
				<input type="text" name="contributors[{$contributorId|escape}][url]" id="contributors-{$contributorId|escape}-url" value="{$contributor.url|escape}" size="40" maxlength="255" class="form-control" />{if $smarty.foreach.contributors.total > 1} <input type="submit" name="delContributor[{$contributorId|escape}]" value="{translate key="common.delete"}" class="btn btn-danger" />{/if}
			</div>
		</div>
		{if !$smarty.foreach.contributors.last}
		<div class="separator"></div>
		<br>
		{/if}
		{foreachelse}
		<div class="form-group">
			<label for="contributors[0][name]" class="col-sm-2 control-label">{fieldLabel name="contributors-0-name" key="manager.setup.contributor"}</label>
			<div class="col-sm-10">
				<input type="text" name="contributors[0][name]" id="contributors-0-name" size="40" maxlength="90" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="contributors[0][url]" class="col-sm-2 control-label">{fieldLabel name="contributors-0-url" key="common.url"}</label>
			<div class="col-sm-10">
				<input type="text" name="contributors[0][url]" id="contributors-0-url" size="40" maxlength="255" class="form-control" />
			</div>
		</div>
		{/foreach}
		<div class="form-group">
			<div class="col-sm-10">
				<input type="submit" name="addContributor" value="{translate key="manager.setup.addContributor"}" class="btn btn-info" />
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<div id="searchEngineIndexing">
		<h3>1.8 {translate key="manager.setup.searchEngineIndexing"}</h3>

		<p>{translate key="manager.setup.searchEngineIndexingDescription"}</p>

		<div class="form-group">
			<label for="searchDescription" class="col-sm-2 control-label">{fieldLabel name="searchDescription" key="common.description"}</label>
			<div class="col-sm-10">
				<input type="text" name="searchDescription[{$formLocale|escape}]" id="searchDescription" value="{$searchDescription[$formLocale]|escape}" size="40" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="searchKeywords" class="col-sm-2 control-label">{fieldLabel name="searchKeywords" key="common.keywords"}</label>
			<div class="col-sm-10">
				<input type="text" name="searchKeywords[{$formLocale|escape}]" id="searchKeywords" value="{$searchKeywords[$formLocale]|escape}" size="40" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label for="customHeaders" class="col-sm-2 control-label">{fieldLabel name="customHeaders" key="manager.setup.customTags"}</label>
			<div class="col-sm-10">
				<textarea name="customHeaders[{$formLocale|escape}]" id="customHeaders" rows="3" cols="40" class="form-control">{$customHeaders[$formLocale]|escape}</textarea>
			</div>
			<div class="col-sm-10">
				<p class="instruct">{translate key="manager.setup.customTagsDescription"}</p>
			</div>
		</div>

	</div>

	<div class="separator"></div>


	<h3>1.9 {translate key="manager.setup.history"}</h3>

	<p>{translate key="manager.setup.historyDescription"}</p>


	<div class="form-group">
		<label for="" class="col-sm-2 control-label">{fieldLabel name="history" key="manager.setup.history"}</label>
		<div class="col-sm-10">
			<textarea name="history[{$formLocale|escape}]" id="history" rows="5" cols="40" class="form-control">{$history[$formLocale]|escape}</textarea>
		</div>
	</div>



	<div class="separator"></div>
	<div class="form-group">
		<div class="col-sm-10">
			<input type="submit" value="{translate key="common.saveAndContinue"}" class="btn btn-success" />
			<input type="button" value="{translate key="common.cancel"}" class="btn btn-danger" onclick="document.location.href='{url op="setup" escape=false}'" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-10">
			<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
		</div>
	</div>

</form>

{include file="common/footer.tpl"}

