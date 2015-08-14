{**
 * templates/common/mobileSidebar.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Submission editing.
 *
 *}
 <div class="col-sm-12">
 <div id="dropdown-mobileSidebar" class="dropdown">
 	<button class="btn btn-default dropdown-toggle" type="button" id="mobileSidebar" data-toggle="dropdown" aria-expanded="true">
 		Sidebar&nbsp;
 		<span class="glyphicon glyphicon-menu-down"></span>
 	</button>
 	<ul class="dropdown-menu" role="menu" aria-labelledby="mobileSidebar">
 		<li>
 			{if $leftSidebarCode || $rightSidebarCode}
				<div id="mobileSidebar">
					{if $leftSidebarCode}
						<div id="leftSidebar">
							{$leftSidebarCode}
						</div>
					{/if}
					{if $rightSidebarCode}
						<div id="rightSidebar">
							{$rightSidebarCode}
						</div>
					{/if}
				</div>
			{/if}			
 		</li>
 	</ul>
 </div>
</div>

