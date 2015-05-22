<div class="blogSummary">
	<h1 class="postTitle"><a href="$Link" title="<% _t('BlogSummary_ss.VIEWFULL', 'View full post titled -') %> '$Title'">$MenuTitle</a></h1>
	<p class="authorDate"><% _t('GenXYZBlog.POSTEDON', 'Posted On') %> $Date.Long</p>
	<% if TagsCollection %>
		<p class="tags">
			<% _t('BlogSummary_ss.TAGS','Tags') %>:
			<% loop TagsCollection %>
				<a href="$Link" title="View all posts tagged '$Tag'" rel="tag">$Tag</a><% if not Last %>,<% end_if %>
			<% end_loop %>
		</p>
	<% end_if %>

	<% if BlogHolder.ShowFullEntry %>
		$Content
	<% else %> 
		<p>$Content.FirstParagraph(html)</p>
	<% end_if %>
	
	<p class="blogVitals">
		<a href="$Link#PageComments_holder" class="comments" title="View Comments for this post">
			$Comments.Count <% _t('BlogSummary_ss.SUMMARYCOMMENTS','comment(s)') %>
		</a> 
        <% if TippyTop.IsSelf %>
		| 
		<a href="$EditURL" id="editpost" title="<% _t('MySite_BlogEntry.EDITTHIS', 'Edit test post') %>"><% _t('MySite_BlogEntry.EDITTHIS', 'Edit post') %></a>
        |
        <a href="$Link(unpublishPost)" id="unpublishpost"><% _t('MySite_BlogEntry.UNPUBLISHTHIS', 'Unpublish test post') %></a>
        <% end_if %>
    </p>
</div>