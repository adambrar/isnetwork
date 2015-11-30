<% include EmptyHeader %>
<div id="content">
    <div class="container margin-bottom">
        <div class="row" style="background-image: radial-gradient(circle at top left, #dfdfdf, yellow 150%);">
            <div class="col-md-3 margin-top">
                <img class="img-responsive img-thumbnail img-rounded" src="$Member.Logo.Filename" title="Profile picture" alt="Profile picture not found" />
                <h2 class="text-center wow fadeInLeft"><a>$Member.Name</a></h2>
                <h5 class="text-center wow fadeInLeft" data-wow-delay="200ms">$Member.Country.Name</h5>
                <h5 class="text-center wow fadeInLeft" data-wow-delay="400ms">Established <span class="text-primary"> 75 Years ago</span></h5>
            </div>
            <div class="col-md-9 wow fadeInRight margin-top">
                <div class="row">
                    <div class="col-md-6 wow fadeInUp">
                        <ul class="list-group">
                            <li class="list-group-item"><i class="fa fa-graduation-cap"></i> Country <span class="pull-right">$Member.Country.Name</span></li>
                            <li class="list-group-item"><i class="fa fa-institution"></i> Type <span class="pull-right">$Member.Type</span></li>
                            <li class="list-group-item"><i class="fa fa-gift"></i>  Joined<span class="pull-right">$Member.Created.Ago</span></li>
                            <li class="list-group-item"><i class="fa fa-map-marker"></i> City <span class="pull-right">$Member.City.Name</span></li>
                        </ul>  
                    </div>
                    <div class="col-md-6 wow fadeInUp" data-wow-delay="300ms">
                        <ul class="list-group">
                            <li class="list-group-item"><i class="fa fa-file-text-o"></i> Number of Blog Posts <span class="pull-right">$Member.getBlogHolder().HolderEntries.Count()</span></li>
                            <li class="list-group-item"><i class="fa fa-folder-open-o"></i> Number of Forum Posts <span class="pull-right">$Member.NumPosts</span></li>
                            <li class="list-group-item"><i class="fa fa-star"></i>  <span class="pull-right">Student</span></li>
                        </ul>  
                    </div>
                </div>
            </div>
        </div>
        <% include SessionMessage %>
        <ul class="nav nav-tabs margin-top">
            <li class="active"><a data-toggle="tab" href="#first">Home</a></li>
            <li><a data-toggle="tab" href="#programs">Academic Programs</a></li>
            <li><a data-toggle="tab" href="#application">Application</a></li>
            <li><a data-toggle="tab" href="#partners">Partners</a></li>
            <li><a data-toggle="tab" href="#contact">Contact</a></li>
            <li><a data-toggle="tab" href="#links">Application Process</a></li>
        </ul>

        <div class="tab-content">
            <div id="first" class="tab-pane fade in active">
                <div class="row">
                    <div class="col-sm-5">
                        <div class="wow fadeInLeft"><p>Cras et blandit nibh, at euismod erat. Sed et ante nec enim fringilla malesuada sed id massa. Quisque feugiat turpis urna, a congue augue eleifend nec. Curabitur eget ex non orci tincidunt accumsan. Fusce volutpat magna id ex mollis feugiat.<br/>
Ut fringilla lorem neque. Fusce tincidunt facilisis est, sed rutrum enim dictum iaculis. Aliquam eget tortor lorem. Suspendisse potenti. Nunc diam arcu, fermentum malesuada libero tempor, sollicitudin auctor sapien. Maecenas iaculis eros quis lectus lobortis, vitae elementum purus consectetur. </p></div>
                    </div>
                    <div class="col-sm-7" style="height:400px;">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                              <li data-target="#myCarousel" data-slide-to="1"></li>
                              <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox" style="max-height:400px;">
                              <div class="item active">
                                <img src="$ProfilePage.SlideOne.Filename()" alt="Chania">
                              </div>

                              <div class="item">
                                <img src="$ProfilePage.SlideTwo.Filename()" alt="Chania">
                             </div>

                              <div class="item">
                                <img src="$ProfilePage.SlideThree.Filename()" alt="Flower">
                             </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                            </a>
                          </div>
                    </div>
                </div>
            </div>
            <div id="programs" class="tab-pane fade">
                <div class="list-group">
                    <% loop Member.Programs() %>
                        <div class="col-md-4 col-sm-6 wow fadeInUp list-group-item" data-wow-duration="300ms" data-wow-delay="100ms">
                            <div class="media service-box">
                                <div class="media-body">
                                    <h4 class="media-heading">$ProgramName.Name <i class="fa fa-arrow-circle-down"></i></h4>
                                    <ul class="list-unstyled">
                                        <% if CertificateLink %><li><i class="fa fa-hand-o-right"></i> <a href="htp://$CertificateLink">Certificate</a></li><% end_if %>
                                        <% if DiplomaLink %><li><i class="fa fa-hand-o-right"></i> <a href="htp://$DiplomaLink">Diploma</a></li><% end_if %>
                                        <% if DegreeLink %><li><i class="fa fa-hand-o-right"></i> <a href="htp://$DegreeLink">Degree</a></li><% end_if %>
                                        <% if MastersLink %><li><i class="fa fa-hand-o-right"></i> <a href="htp://$MastersLink">Masters</a></li><% end_if %>
                                        <% if DoctorateLink %><li><i class="fa fa-hand-o-right"></i> <a href="htp://$DoctorateLink">Doctorate</a></li><% end_if %>
                                    </ul>
                                </div>
                            </div>
                        </div><!--/.col-md-4-->
                    <% end_loop %>
                </div>
            </div>
            <div id="partners" class="tab-pane fade">
                <div class="row">
                    <% if Member.Schools() %>
                        <% loop Member.Schools() %>
                            <div class="col-md-4 col-sm-6 wow fadeInUp" data-wow-duration="300ms" data-wow-delay="100ms">
                                <div class="media service-box">
                                    <div class="row">
                                        <div class="col-xs-1"><% if BusinessLogo %><img class="img-responsive img-thumbnail partner-logo" src="{$BaseHref}{$BusinessLogo.Filename}" alt="Logo" /><% end_if %></div>
                                        <div class="col-xs-10"><h3>$BusinessName</h3></div>
                                    </div>
                                </div>
                            </div><!--/.col-md-4-->
                        <% end_loop %>
                    <% else %>
                        <h4 class="text-center">This school is currently not partnered with any other institutions.</h4>
                    <% end_if %>
                </div>
            </div>
            <div id="application" class="tab-pane fade">
                <div class="row">
                    <div class="col-sm-6">
                        <ul class="list-unstyled text-center">
                            <li><h4>Application Documents required</h4></li>
                            <li><i class="fa fa-check"></i> Passport</li>
                            <li><i class="fa fa-check"></i> CV</li>
                            <li><i class="fa fa-check"></i> Essay</li>
                            <li><i class="fa fa-check"></i> IELTS/TOEFL Score</li>
                            <li><i class="fa fa-check"></i> GRE/GMAT Score</li>
                            <li><i class="fa fa-check"></i> Statement of Purpose</li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        $ApplicationForm                   
                    </div>
                </div>
            </div>
            <div id="contact" class="tab-pane fade">
                <div class="wow fadeInUp">
                    $ProfilePage.ContactInfo
                </div>
            </div>
            <div id="links" class="tab-pane fade">
                <div class="row">
                    <div class=" col-sm-6 col-sm-offset-3 list-group">
                        <a class="text-center list-group-item list-group-item-info wow fadeInUp" data-wow-delay="0ms" href="http://$ProfilePage.Fees" target="_blank"><i class="fa fa-usd" aria-hidden="true"></i> FEES</a>
                        <a class="text-center list-group-item list-group-item-info wow fadeInUp" data-wow-delay="100ms" href="http://$ProfilePage.Application" target="_blank"><i class="fa fa-envelope-o" aria-hidden="true"></i> APPLICATION</a>
                        <a class="text-center list-group-item list-group-item-info wow fadeInUp" data-wow-delay="200ms" href="http://$ProfilePage.ProcessingTime" target="_blank"><i class="fa fa-clock-o" aria-hidden="true"></i> PROCESSING TIME</a>
                        <a class="text-center list-group-item list-group-item-info wow fadeInUp" data-wow-delay="300ms" href="http://$ProfilePage.EnglishRequirements" target="_blank"><i class="fa fa-book" aria-hidden="true"></i> ENGLISH REQUIREMENTS</a>
                        <a class="text-center list-group-item list-group-item-info wow fadeInUp" data-wow-delay="400ms" href="http://$ProfilePage.AdmissionRequirements" target="_blank"><i class="fa fa-edit" aria-hidden="true"></i> ADMISSION REQUIREMENTS</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>