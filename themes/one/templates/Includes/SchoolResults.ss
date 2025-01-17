<% if PaginatedResults %>
    <% if CurrentMember %>
        <% if PaginatedResults.MoreThanOnePage %><div class="pagination-wrapper text-right" data-pagination-pages="{$PaginatedResults.TotalPages}" data-page-length="{$PaginatedResults.getPageLength}"></div><% end_if %>
        <div class="row form-group match-height-boxes">
            <% loop PaginatedResults %>
                <div class="wow fadeInRight" data-wow-delay="<% if Pos < 5 %>{$Pos}<% else %>3<% end_if %>00ms">
                    <div class="panel panel-primary match-height-box">
                        <a href="{$viewLink()}">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="text-center col-xs-2">
                                        <% if Logo %>
                                            <img class="img-responsive img-thumbnail partner-logo" style="max-height:7em;width:100%" src="{$BaseHref}{$Logo.Filename}" alt="Logo" />
                                        <% else %>
                                            <img class="img-responsive img-thumbnail partner-logo" style="max-height:7em;width:100%" src="{$BaseHref}{$SiteConfig.DefaultSchoolLogo.Filename}" alt="Logo" />
                                        <% end_if %>
                                    </div>
                                    <div class="col-xs-6">
                                        <h4 class="panel-title"><strong>$Name</strong></h4>
                                        <p>$Country.Name</p>
                                        <% if $GetRating() %>
                                            <input type="hidden" class="rating" value="{$GetRating()}" data-readonly data-filled="glyphicon glyphicon-star fa-2x" data-empty="glyphicon glyphicon-star-empty fa-2x" data-fractions="4" />
                                        <% else %>
                                            <p>No ratings yet!</p>
                                        <% end_if %>
                                    </div>
                                    <div class="text-right col-xs-4">
                                        <p><strong>Level:</strong> $Type</p>
                                        <p><strong>Size:</strong> $SchoolSize Students</p>
                                        <p><strong>Established:</strong> $Established</p>

                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            <% end_loop %>
        </div>
        <% if PaginatedResults.MoreThanOnePage %><div class="pagination-wrapper text-right" data-pagination-pages="{$PaginatedResults.TotalPages}" data-page-length="{$PaginatedResults.getPageLength}"></div><% end_if %>
    <% else %>
        <div class="jumbotron text-center">
            <p>There are <strong>$PaginatedResults.Count Results</strong> for you to view.</p>
            <p>You need to be a registered user to view results so please login or register below.</p>
            <% include LoginRegister %>
        </div>
    <% end_if %>
<% else %>
    <br/>
<p>No results were found for your search! Select different parameters and try again.</p>
<% end_if %>