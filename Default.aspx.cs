using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            populateRssFeed();
        }
    }
    private void populateRssFeed()
    {
        //string RssFeedtwitter = "http://twitrss.me/twitter_user_to_rss/?user=%40DataDirectGroup";
        string RssFeedtwitter = "http://twitrss.me/twitter_user_to_rss/?user=DataDirectGroup";
        //string RssFeedfb = "https://fbrss.com/feed/150f2f7c9de2edcaa98c4d81b90c135040aaae29.xml";
        //string RssFeedUrl = "https://www.wallflux.com/feed/302117736958977";
        List<Feeds> feeds = new List<Feeds>();
        try
        {
            XDocument xDoc = new XDocument();
            //XDocument xDocfb = new XDocument();

            //getting twitter rssfeed
            xDoc = XDocument.Load(RssFeedtwitter);
            var items = (from x in xDoc.Descendants("item")
                         select new
                         {
                             link = x.Element("link").Value,
                             pubDate = x.Element("pubDate").Value,
                             description = x.Element("description").Value
                         });

            ////getting facebook rssfeed
            //xDocfb = XDocument.Load(RssFeedfb);
            //var itemsfb = (from x in xDocfb.Descendants("item")
            //               select new
            //               {
            //                   link = x.Element("link").Value,
            //                   pubDate = x.Element("pubDate").Value,
            //                   description = x.Element("description").Value
            //               });

            //loading twitter rssfeed
            int count = 0;
            if (items != null)
            {
                foreach (var i in items)
                {
                    count++;
                    if (count > 10)
                        break;
                    Feeds f = new Feeds
                    {
                        Link = i.link,
                        PublishDate = Convert.ToDateTime(i.pubDate).ToString("MM-dd-yyyy"),
                        //Title is used for image
                        Title = imgsrc(i.description) +" alt=\"Data Direct Twitter Feeds\"",
                        //Description= i.description
                        Description = rem(i.description.IndexOf("<img src=") >= 0 ? i.description.Remove(i.description.IndexOf("<img src="), i.description.IndexOf("/>") - i.description.IndexOf("<img src=") + 2) : i.description, "<b>", 3)
                    };
                    feeds.Add(f);
                }
            }

            ////loading facebook rssfeed
            //if (itemsfb != null)
            //{
            //    foreach (var i in itemsfb)
            //    {
            //        Feeds f = new Feeds
            //        {
            //            Link = i.link,
            //            PublishDate = Convert.ToDateTime(i.pubDate).ToString("MM-dd-yyyy"),
            //            Description = i.description
            //        };

            //        feeds.Add(f);
            //    }
            //}

            gvrss.DataSource = feeds;
            gvrss.DataBind();
        }
        catch (Exception ex)
        {
            if (ex.GetType().IsAssignableFrom(typeof(System.Net.WebException)))
            {
                return;         
            }
        }
    }
    private string rem(string main, string from, int count)
    {
        while (main.IndexOf(from) >= 0)
            main = main.Remove(main.IndexOf(from), count);
        return  main;
    }

    private string imgsrc(string main)
    {
        if (main.IndexOf("<img src=") >= 0)
        {
            main = main.Substring(main.IndexOf("<img src="), main.IndexOf("/>") - main.IndexOf("<img src="));
            main = main.Substring(main.IndexOf("http"), main.IndexOf("\" w") - main.IndexOf("http"));
        }
        else
            main = "images/datadirectlogo.png";

        return main;
    }

}


