{**
 * templates/common/footer.tpl
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2000-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site footer.
 *
 *}
{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
{if $displayCreativeCommons}
	{translate key="common.ccLicense"}
{/if}
{if $pageFooter}
	<br /><br />
	<div id="pageFooter">{$pageFooter}</div>
{/if}
{call_hook name="Templates::Common::Footer::PageFooter"}
</div><!-- content -->
</div><!-- main -->
{if $rightSidebarCode}
<div id="sidebarRight"
    {if $leftSidebarCode}
        class="col-xs-6 col-sm-3 col-md-2 sidebar-offcanvas"
    {else}
        class="col-xs-6 col-sm-3 col-md-3 col-lg-2 sidebar-offcanvas"
    {/if}
  role="navigation">
	<div id="rightSidebar" class="sidebar-nav">
		<ul class="nav">
			{$rightSidebarCode}
		</ul>
	</div>
</div>
{/if}
</div> {* row *}
</div><!-- body -->

{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}

</div><!-- container -->
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
</body>
</html>
