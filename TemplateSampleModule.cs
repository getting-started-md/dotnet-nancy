public class TemplateSampleModule : Nancy.NancyModule
{
    public TemplateSampleModule()
    {
        Get["/hello"] = Hello;
    }

    private dynamic Hello(dynamic parameters)
    {
        ViewBag.title = "Hello World!";
        return View["hello_world"];
    }
}