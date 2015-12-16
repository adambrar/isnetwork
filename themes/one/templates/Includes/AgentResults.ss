<% if PaginatedResults %>
     <% if PaginatedResults.MoreThanOnePage %><div class="pagination-wrapper text-right" data-pagination-pages="{$PaginatedResults.TotalPages}" data-page-length="{$PaginatedResults.getPageLength}"></div><% end_if %>
    <div class="row form-group match-height-boxes">
        <% loop PaginatedResults %>
            <div class="text-center wow fadeInRight col-lg-4 col-sm-6" data-wow-delay="<% if Pos < 5 %>{$Pos}<% else %>4<% end_if %>00ms">
                <div class="panel panel-primary match-height-box">
                    <a href="{$viewLink()}">
                        <div class="panel-body">
                            <div class="row">
                                <div class="text-left col-xs-7">
                                    <h4 class="panel-title"><strong>$Name</strong></h4>
                                    <p>$Country.Name</p>
                                </div>
                                <div class="text-left col-xs-5">
                                    <% if Logo %>
                                        <img class="" style="max-height:7em;width:100%" src="{$BaseHref}{$Logo.Filename}" alt="Logo" />
                                    <% else %>
                                        <img class="" style="max-height:7em;width:100%" src="{$BaseHref}{$SiteConfig.DefaultAgentLogo.Filename}" alt="Logo" />
                                    <% end_if %>
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
<p>Select search parameters to see results.</p>
<% end_if %>