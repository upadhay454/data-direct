<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div id="myCarousel mar" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner mar"><!-- Wrapper -->
                <div class="item myitem active"><!-- item1 -->
                <img src="images/Banner1.png" style="width:100%" alt="Nam Nguyen, Chairman &amp; Founder with Ebraham Sesook, Founder &amp; CEO"/>
                <div class="carousel-caption hidden-xs hidden-sm">
                    <p>Nam Nguyen, Chairman; Founder <br />Ebraham Sesook, Founder; CEO</p>
                </div>
                </div><!-- /item1 -->
                <div class="item myitem"><!-- item2 -->
                <img src="images/Banner2.png" style="width:100%" alt="William Lukasik with Kevin Ambi" />
                <div class="carousel-caption hidden-xs hidden-sm">
                    <p>William Lukasik, VP e-Commerce & Fulfillment <br />Kavindran (Kevin) Ambikapathy, Shipper/Receiver</p>
                </div>
                </div><!-- /item2 -->
                <div class="item myitem"><!-- item3 -->
                <img src="images/Banner3.png" style="width:100%" alt="Debbie Major & Laura Artibello" />
                <div class="carousel-caption hidden-xs hidden-sm">
                    <p>Debbie Major, President <br />Laura Artibello, Executive Advisor; Data Analytics</p>
                </div>
                </div><!-- /item3 -->
                <div class="item myitem"><!-- item4 -->
                <img src="images/Banner4.png" style="width:100%"  alt="The Data Direct Group - Christmas Party"/>
                <div class="carousel-caption hidden-xs hidden-sm">
                    <p>Company Festivities December 2017</p>
                </div>
                </div><!-- /item4 -->
            </div><!-- /Wrapper -->
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev"></a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next"></a>
        </div><!-- /mycarousel row -->
        <div class="row mar"><!-- services & connect with us row -->
            <div class="col-md-8 mar"><!-- The data in Data Direct col -->
                <div class="bluep bgp">The Data in Data Direct</div>
                <div class="mar"><!-- container -->
                    <p>Communicating through mail? Data Direct is one of Canada’s largest Direct Mail Supplier to Canada Post, our final delivery channel partner.  </p>
                    <p>E-Commerce fulfillment is aligned with same data driven reliance. </p>
                    <p>Data Analysis. Analytics identifies the who, why, when & where your customers & members belong in your value chain.  Survey & Evaluation services are offered in a variety of formats to support your Data Driven Metrics.  </p>
                    <a class="btn btn-primary bluebtn bgbtn" href="services?page=services">More &raquo;</a>  
                </div><!-- /mar -->
            </div><!-- /The data in Data Direct col -->
            <div class="col-md-4 mar"><!-- Connect with us col -->
                <div class="container " style="background-color:grey; color:white; padding:5px 20px 30px 30px; box-shadow:0 2px 2px grey;"><!-- Container -->
                    <div class="greyp bgp">Connect With Us<br /><br /></div>
                    <div class="mar">
                        <span class="glyphicon glyphicon-earphone" style="padding-top:3px; padding-bottom:3px;"></span><a  class="servicea">(905) 564-0150</a><br />
                        <span class="glyphicon glyphicon-envelope" style="padding-top:3px; padding-bottom:3px;"></span> <a  class="servicea" href="mailto:info@datadirect.ca">info@datadirect.ca<br/></a><br /><br />
                        <span><a class="fa fa-facebook greysm" href="https://www.facebook.com/Data-Direct-Group-Inc-191418960916721/" target="_blank"></a></span>
                        <span><a class="fa fa-twitter greysm" href="https://twitter.com/DataDirectGroup" target="_blank"></a></span>
                        <span><a class="fa fa-linkedin greysm" href="https://www.linkedin.com/company/data-direct-group?trk=company_logo" target="_blank"></a></span>
                        <span><a class="fa fa-instagram greysm" href="https://www.instagram.com/data.direct.group/" target="_blank"></a></span><br /><br />
                    </div><!-- /mar -->
                </div><!-- /Container -->
            </div><!-- /Connect with us col -->
        </div><!-- /Services & connect with us -->
        <div class="row mar mb10"><!-- News & Expertise -->
            <div class="col-md-4 mar"><!-- Our Expertise col. -->
                <div class="greyp bgp">Our Expertise</div>
                <div style="margin-top:10px;"><!-- Container -->
                    <p><a href="ServiceDetails?page=services#service1">Data Preparation</a></p>
                    <p><a href="ServiceDetails?page=services#service2">Digital Print Shop</a></p>
                    <p><a href="ServiceDetails?page=services#service3">Offset Print & Bindery</a></p>
                    <p><a href="ServiceDetails?page=services#service4">Direct Mail Lettershop</a></p>
                    <p><a href="ServiceDetails?page=services#service5">e-Commerce & Fulfillment</a></p>
                    <p><a href="ServiceDetails?page=services#service6">Data Analysis</a></p>
                    <p><a href="ServiceDetails?page=services#service7">Inventory Management</a></p>
                    <p><a href="ServiceDetails?page=services#service8">Canada Post</a></p>
                    <p><a href="ServiceDetails?page=services#service9">Data Promotions</a></p>
                </div><!-- /Container -->
            </div><!-- /Our Expertise col. -->
            <div class="col-md-8 mar"><!-- News Feed col. -->
                <div class="bluep bgp">Data Dynamics</div>
                <div class="container" style="padding:10px 0px 20px 5px; max-height:500px; overflow-y:auto; overflow-wrap: break-word"><!-- Container -->
                    <asp:GridView ID="gvrss" runat="server" AutoGenerateColumns="false" Width="90%" GridLines="None" AlternatingRowStyle-Wrap="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-md-4" style="padding-bottom:20px;"><img src=<%#Eval("Title")%> style="width:150px;" /></div>
                                        <div class="col-md-8">
                                            <div style="margin-bottom:10px; font-size:medium"><%#Eval("PublishDate")%></div>
                                            <div ><%#Eval("Description")%></div>
                                            <div style="font-size:medium; margin-top:5px;"><a href='<%#Eval("Link")%>' target="_blank">READ MORE...</a></div>
                                        </div>
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div><!-- /Container -->
            </div><!-- /News Feed col. -->
        </div><!-- /News & Expertise -->
</asp:Content>
